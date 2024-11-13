arminstructionrate: arminstructionrate.s arminstructionrate.c arminstructionrate.h
	LD_LIBRARY_PATH="${ANDROID_LD_LIB_PATH}:${LD_LIBRARY_PATH}"	aarch64-linux-android34-clang -march=armv8+memtag+pauth -O3 arminstructionrate.s arminstructionrate.c -o arminstructionrate
