#!/bin/bash

echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

echo
echo "#==========================================================="
echo "Start Times"

for file in $(find . -name "rplpl-slurm*.out" -type f); do
    echo "$file" | sed 's|^\./||' | sed 's/^/==> /; s/$/ <==/'
    grep "time.struct_time" "$file" | head -n 1
done

echo

for file in $(find . -name "rs*-slurm*.out" -type f); do
    echo "$file" | sed 's|^\./||' | sed 's/^/==> /; s/$/ <==/'
    grep "time.struct_time" "$file" | head -n 1
done

echo

echo "End Times"

for file in $(find . -name "rplpl-slurm*.out" -type f); do
    echo "$file" | sed 's|^\./||' | sed 's/^/==> /; s/$/ <==/'
    grep "time.struct_time" "$file" | tail -n 1
    grep "MessageId" "$file" | sed 's/^/{\n/; s/$/\n}/'
done

echo

for file in $(find . -name "rs*-slurm*.out" -type f); do
    echo "$file" | sed 's|^\./||' | sed 's/^/==> /; s/$/ <==/'
    grep "time.struct_time" "$file" | tail -n 1
    grep "MessageId" "$file" | sed 's/^/{\n/; s/$/\n}/'
done

echo "#==========================================================="

