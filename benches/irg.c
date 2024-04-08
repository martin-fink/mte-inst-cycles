#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/auxv.h>
#include <sys/mman.h>
#include <sys/prctl.h>

#define bench_setup \
    unsigned long long x0 = 1; \
    unsigned long long x1 = 2; \
    if (prctl(PR_SET_TAGGED_ADDR_CTRL, PR_TAGGED_ADDR_ENABLE | PR_MTE_TCF_SYNC | (0xfffe << PR_MTE_TAG_SHIFT), 0, 0, 0)) { \
        perror("prctl() failed");                                                                                          \
        return EXIT_FAILURE;                                                                                               \
    }
#ifdef THROUGHPUT
#define op __asm__ volatile("irg %0, %1" : "=r"(x0) : "r"(x1));
#endif
#ifdef LATENCY
#define op __asm__ volatile("irg %0, %1" : "=r"(x0) : "r"(x0));
#endif
#ifdef BASELINE
#define op __asm__ volatile("" : : : "memory");
#endif

#define bench_teardown \
    NO_DCE(x0);        \
    NO_DCE(x1);

#include "../src/driver.h"
