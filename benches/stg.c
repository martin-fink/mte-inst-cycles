#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/auxv.h>
#include <sys/mman.h>
#include <sys/prctl.h>

#define bench_setup \
    unsigned long long x0 = 0; \
    if (prctl(PR_SET_TAGGED_ADDR_CTRL, PR_TAGGED_ADDR_ENABLE | PR_MTE_TCF_SYNC | (0xfffe << PR_MTE_TAG_SHIFT), 0, 0, 0)) { \
        perror("prctl() failed");                                                                                          \
        return EXIT_FAILURE;                                                                                               \
    }               \
    void *ptr = mmap(NULL, sysconf(_SC_PAGESIZE), PROT_READ | PROT_WRITE | PROT_MTE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0); \
    if (ptr == MAP_FAILED) \
    { \
        perror("mmap() failed"); \
        return EXIT_FAILURE; \
    }               \
    void *p __attribute__((unused)) = ptr;  \

#ifdef THROUGHPUT
#define op __asm__ volatile("stg %1, [%0]" : "+r"(p) : "r"(x0) : "memory");
#endif
#ifdef LATENCY
#define loop_setup p = ptr;
#define op __asm__ volatile("stg %0, [%0], #16" : "+r"(p) : : "memory");
#endif
#ifdef BASELINE
#define op __asm__ volatile("" : : : "memory");
#endif

#define bench_teardown \
    NO_DCE(x0);        \
    munmap(ptr, sysconf(_SC_PAGESIZE));

#include "../src/driver.h"
