#define bench_setup

#define op __asm__ volatile("" : : : "memory");

#define bench_teardown

//#define ITERATIONS 0ull

#include "../src/driver.h"
