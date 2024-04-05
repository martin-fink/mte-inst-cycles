#define bench_setup \
    unsigned long long x0 = 1; \
    unsigned long long x1 = 2; \
    unsigned long long x2 = 3;

#ifdef THROUGHPUT
#define op __asm__ volatile("add %0, %1, %2" : "+r"(x0) : "r"(x1), "r"(x2));
#endif
#ifdef LATENCY
#define op __asm__ volatile("add %0, %1, %2" : "+r"(x0) : "r"(x0), "r"(x1));
#endif
#ifdef BASELINE
//#define ITERATIONS 0
#define op __asm__ volatile("" : : : "memory");
#endif

#define bench_teardown \
    NO_DCE(x0);        \
    NO_DCE(x1);        \
    NO_DCE(x2);

#include "../src/driver.h"
