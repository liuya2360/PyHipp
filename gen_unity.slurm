#!/bin/bash

# Submit this script with: sbatch <this-filename>

#SBATCH --time=24:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --cpus-per-task=1	# number of processors per task
#SBATCH -J "gen_unity"   # job name

## /SBATCH -p general # partition (queue)
#SBATCH -o gen_unity-slurm.%N.%j.out # STDOUT
#SBATCH -e gen_unity-slurm.%N.%j.err # STDERR

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE

python -u -c "import PyHipp as pyh; \
DPT.objects.processDirs(dirs=None, objtype=pyh.Unity, saveLevel=1);"
