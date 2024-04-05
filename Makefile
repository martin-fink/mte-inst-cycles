CC=/Users/martin/Library/Android/sdk/ndk/26.1.10909125/toolchains/llvm/prebuilt/darwin-x86_64/bin/clang
CFLAGS=-O2 -Wall -target aarch64-linux-android34 -march=armv8.5-a+memtag

benches = $(wildcard benches/*.c)
objects = $(benches:benches/%.c=build/%)

all: build_dir $(objects)

build_dir:
	mkdir -p build

sync: all
	adb push build/. driver.sh /data/local/tmp/timing

.PHONY: clean
clean:
	rm -rf build

build/cpuinfo: src/cpuinfo.c src/driver.h
	$(CC) $(CFLAGS) $< -o $@

build/baseline: src/baseline.c src/driver.h
	$(CC) $(CFLAGS) $< -o $@

# build all benches
build/%: benches/%.c src/driver.h
	$(CC) $(CFLAGS) -D LATENCY $< -o $@-latency
	$(CC) $(CFLAGS) -D THROUGHPUT $< -o $@-throughput
	$(CC) $(CFLAGS) -D BASELINE $< -o $@-baseline
