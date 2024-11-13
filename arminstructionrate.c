/* This is a series of ARM ISA micro-tests designed to identify and report the execution rate of various instructions on x86-64 processor.
 * The tests are principally in assembly, that is wrapped in C code to handle timing and reporting results
 * Clam did all the hard work, Nintonito just cleaned it up a bit.  Give him the real credit
 */

#include "arminstructionrate.h"

#include <sys/prctl.h>
#include <sys/mman.h>
#include <stdlib.h>
#include <unistd.h>

static void *mte_arr;

int main(int argc, char *argv[]) 
{
  //Base value for iterations.  Latency tests require a separate, higher value
  uint64_t iterations = 1500000000;
  uint64_t latencyIterations = iterations * 5;
  
  float clkSpeed;//CPU Frequency

  if (prctl(PR_SET_TAGGED_ADDR_CTRL, PR_TAGGED_ADDR_ENABLE | PR_MTE_TCF_SYNC | (0xfffe << PR_MTE_TAG_SHIFT), 0, 0, 0)) {
    perror("prctl() failed");
    return EXIT_FAILURE;
  }
  mte_arr = mmap(NULL, sysconf(_SC_PAGESIZE), PROT_READ | PROT_WRITE | PROT_MTE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
  if (mte_arr == MAP_FAILED) {
    perror("mmap() failed");
    return EXIT_FAILURE;
  }

  //Establish baseline clock speed for CPU, for all further calculations
  clkSpeed = measureFunction(latencyIterations, clkSpeed, clktest);
  printf("Estimated clock speed: %.2f GHz\n", clkSpeed);
  
  printf("irg throughput: %.2f\n", measureFunction(latencyIterations, clkSpeed, irgtest));
  printf("irg latency: %.2f\n", 1/measureFunction(latencyIterations, clkSpeed, irglatencytest));
  printf("addg throughput: %.2f\n", measureFunction(latencyIterations, clkSpeed, addgtest));
  printf("addg latency: %.2f\n", 1/measureFunction(latencyIterations, clkSpeed, addglatencytest));
  printf("subg throughput: %.2f\n", measureFunction(latencyIterations, clkSpeed, subgtest));
  printf("subg latency: %.2f\n", 1/measureFunction(latencyIterations, clkSpeed, subglatencytest));
  printf("subp throughput: %.2f\n", measureFunction(latencyIterations, clkSpeed, subptest));
  printf("subp latency: %.2f\n", 1/measureFunction(latencyIterations, clkSpeed, subplatencytest));
  printf("subps throughput: %.2f\n", measureFunction(latencyIterations, clkSpeed, subpstest));
  printf("subps latency: %.2f\n", 1/measureFunction(latencyIterations, clkSpeed, subpslatencytest));
  printf("stg per cycle: %.2f\n", measureFunction(latencyIterations, clkSpeed, stgtestwrapper));
  printf("st2g per cycle: %.2f\n", measureFunction(latencyIterations, clkSpeed, st2gtestwrapper));
  printf("stzg per cycle: %.2f\n", measureFunction(latencyIterations, clkSpeed, stzgtestwrapper));
  printf("stz2g per cycle: %.2f\n", measureFunction(latencyIterations, clkSpeed, stz2gtestwrapper));
  printf("stgp per cycle: %.2f\n", measureFunction(latencyIterations, clkSpeed, stgptestwrapper));
  printf("ldg per cycle: %.2f\n", measureFunction(latencyIterations, clkSpeed, ldgtestwrapper));

  float orrlatency = 1/measureFunction(latencyIterations, clkSpeed, orrlatencytest);
  printf("pacdza throughput: %.2f\n", measureFunction(latencyIterations, clkSpeed, pacdzatest));
  printf("pacdza latency: %.2f\n", 1/measureFunction(latencyIterations, clkSpeed, pacdzalatencytest));
  printf("orr latency: %.2f\n", orrlatency);
  printf("pacda throughput: %.2f\n", measureFunction(latencyIterations, clkSpeed, pacdatest));
  printf("pacda latency: %.2f\n", 1/measureFunction(latencyIterations, clkSpeed, pacdalatencytest));
  printf("autdza throughput: %.2f\n", measureFunction(latencyIterations, clkSpeed, autdzatest));
  printf("autdza latency: %.2f\n", 1/measureFunction(latencyIterations, clkSpeed, autdzalatencytest) - orrlatency);
  printf("autda throughput: %.2f\n", measureFunction(latencyIterations, clkSpeed, autdatest));
  printf("autda latency: %.2f\n", 1/measureFunction(latencyIterations, clkSpeed, autdalatencytest) - orrlatency);
  printf("xpacd throughput: %.2f\n", measureFunction(latencyIterations, clkSpeed, xpacdtest));
  printf("xpacd latency: %.2f\n", 1/measureFunction(latencyIterations, clkSpeed, xpacdlatencytest));

    return 0;
}

/*Measures the execution time of the test specified, assuming a fixed clock speed.
*Then calculates the number of operations executed per clk as a measure of throughput.
*Returns the clk speed if the test was clktest, otherwise returns the opsperclk
*Param uint64_t iterations: the number of iterations the test should run through
*Param float clkspeed: the recorded clock frequency of the CPU for the test.
*Param uint64t (*testfunc) uint64_t: a pointer to the test function to be executed
*/
float measureFunction(uint64_t iterations, float clkSpeed, __attribute((sysv_abi)) uint64_t (*testfunc)(uint64_t))
{
  //Time structs for sys/time.h
  struct timeval startTv, endTv;
  struct timezone startTz, endTz;

  uint64_t time_diff_ms, retval;
  float latency, opsPerNs;

  gettimeofday(&startTv, &startTz);//Start timing
  retval = testfunc(iterations);//Assembly Test Execution
  gettimeofday(&endTv, &endTz);//Stop timing

  //Calculate the ops per iteration, or if clktest, the clock speed
  time_diff_ms = 1000 * (endTv.tv_sec - startTv.tv_sec) + ((endTv.tv_usec - startTv.tv_usec) / 1000);
  latency = 1e6 * (float)time_diff_ms / (float)iterations;
  opsPerNs = 1 / latency;
  
  //Determine if outputting the clock speed or the op rate by checking whether clktest was run
  if(testfunc == clktest)
  {
    clkSpeed = opsPerNs;
    return clkSpeed;
  }
  else
    return opsPerNs / clkSpeed;
}

uint64_t stgtestwrapper(uint64_t iterations) {
  if (((uint64_t)mte_arr & 63) != 0) {
    printf("Warning - load may not be 64B aligned\n");
  }

  return stgtest(iterations, mte_arr);
}

uint64_t st2gtestwrapper(uint64_t iterations) {
  if (((uint64_t)mte_arr & 63) != 0) {
    printf("Warning - load may not be 64B aligned\n");
  }

  return st2gtest(iterations, mte_arr);
}

uint64_t stzgtestwrapper(uint64_t iterations) {
  if (((uint64_t)mte_arr & 63) != 0) {
    printf("Warning - load may not be 64B aligned\n");
  }

  return stzgtest(iterations, mte_arr);
}

uint64_t stz2gtestwrapper(uint64_t iterations) {
  if (((uint64_t)mte_arr & 63) != 0) {
    printf("Warning - load may not be 64B aligned\n");
  }

  return stz2gtest(iterations, mte_arr);
}

uint64_t stgptestwrapper(uint64_t iterations) {
  if (((uint64_t)mte_arr & 63) != 0) {
    printf("Warning - load may not be 64B aligned\n");
  }

  return stgptest(iterations, mte_arr);
}

uint64_t ldgtestwrapper(uint64_t iterations) {
  if (((uint64_t)mte_arr & 63) != 0) {
    printf("Warning - load may not be 64B aligned\n");
  }

  return ldgtest(iterations, mte_arr);
}
