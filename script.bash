#!/bin/bash
rm -f results.csv
if [ "$1" != "" ]; then
        echo "Number trials, block size, mega trials/sec, percent chance" >> results.csv
fi

for t in 1024 4096 16384 65536 262144 1048576 2097152
do
        for b in 8 32 64 128
        do
                /usr/local/apps/cuda/cuda-10.1/bin/nvcc -DNUMTRIALS=$t -DBLOCKSIZE=$b -o proj05  proj05.cu $*
                ./proj05 2>> results.csv
        done
done