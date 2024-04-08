#!/usr/bin/env bash

# run all programs in the current directory ending in -latency with perf stat -e cpu-cycles. Then calculate the throughput.

iterations=10000000000

echo "benchmark,latency,throughput,uops"

for f in ./*-baseline; do
	benchmark="${f%-baseline}"

  baseline_output=$(../simpleperf stat -e cpu-cycles:u,raw-op-retired:u,instructions:u "./$benchmark-baseline")
  baseline_cycles=$(echo "$baseline_output" | grep cpu-cycles | awk '{print $1}' | sed 's/,//g')
  baseline_mu_ops=$(echo "$baseline_output" | grep raw-op-retired | awk '{print $1}' | sed 's/,//g')
  baseline_insts=$(echo "$baseline_output" | grep instructions | awk '{print $1}' | sed 's/,//g')

  lat_output=$(../simpleperf stat -e cpu-cycles:u,raw-op-retired:u,instructions:u "./$benchmark-latency")
  cycles=$(echo "$lat_output" | grep cpu-cycles | awk '{print $1}' | sed 's/,//g')
  mu_ops=$(echo "$lat_output" | grep raw-op-retired | awk '{print $1}' | sed 's/,//g')
  insts=$(echo "$lat_output" | grep instructions | awk '{print $1}' | sed 's/,//g')
  latency=$(echo "scale=6; ($cycles - $baseline_cycles) / ($insts - $baseline_insts)" | bc)

  mu_ops_per_inst=$(echo "scale=6; ($mu_ops - $baseline_mu_ops) / ($insts - $baseline_insts)" | bc)

  tp_output=$(../simpleperf stat -e cpu-cycles:u,instructions:u "./$benchmark-throughput")
  cycles=$(echo "$tp_output" | grep cpu-cycles | awk '{print $1}' | sed 's/,//g')
  insts=$(echo "$tp_output" | grep instructions | awk '{print $1}' | sed 's/,//g')
  throughput=$(echo "scale=6; ($cycles - $baseline_cycles) / ($insts - $baseline_insts)" | bc)

  echo "$benchmark,$latency,$throughput,$mu_ops_per_inst"
done
