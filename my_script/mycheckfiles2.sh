#!/bin/bash

echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

echo
echo "#==========================================================="
echo "Start Times"

find . -name "rplpl-slurm*.out" | sed 's|^\./||' | sed 's/^/==> /; s/$/ <==/'
find . -name "rplpl-slurm*.out" -exec grep -m 1 "time.struct_time" {} \;

echo

find . -name "rplspl-slurm*.out" | sed 's|^\./||' | sed 's/^/==> /; s/$/ <==/'
find . -name "rplspl-slurm*.out" -exec grep -m 1 "time.struct_time" {} \;

echo "End Times"

find . -name "rplpl-slurm*.out" | sed 's|^\./||' | sed 's/^/==> /; s/$/ <==/'
find . -name "rplpl-slurm*.out" -exec grep "time.struct_time" {} \; | tail -n 1
find . -name "rplpl-slurm*.out" -exec grep "MessageId" {} \; | sed 's/^/{\n/; s/$/\n}/'

echo

find . -name "rplspl-slurm*.out" | sed 's|^\./||' | sed 's/^/==> /; s/$/ <==/'
find . -name "rplspl-slurm*.out" -exec grep "time.struct_time" {} \; | tail -n 1
find . -name "rplspl-slurm*.out" -exec grep "MessageId" {} \; | sed 's/^/{\n/; s/$/\n}/'

echo "#==========================================================="

echo


for file in $(find . -name "*-slurm*.out" -type f); do
    echo "$file" | sed 's|^\./||' | sed 's/^/==> /; s/$/ <==/'
    grep "MessageId" "$file" | sed 's/^/{\n/; s/$/\n}/'
done
