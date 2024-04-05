#ifndef ITERATIONS
#define ITERATIONS 400000000ull
#endif

#ifndef bench_setup
#warning "bench_setup not defined"
#define bench_setup
#endif

#ifndef op
#error "op not defined"
#endif

#ifndef bench_teardown
#warning "bench_teardown not defined"
#define bench_teardown
#endif

#ifndef loop_setup
#define loop_setup
#endif

#define op5 op op op op op
#define op25 op5 op5 op5 op5 op5
#define op100 op25 op25 op25 op25
#define op500 op100 op100 op100 op100 op100

#define NO_DCE(val) __asm__ volatile("isb" : "+r"(val))

int main() {
  bench_setup

  // Benchmark loop
  for (unsigned long long i = 0; i < ITERATIONS; i++) {
    loop_setup
    op25
  }

  bench_teardown

  return 0;
}
