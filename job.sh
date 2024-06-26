#!/bin/bash
#SBATCH -M arf
#SBATCH -p orfoz
#SBATCH -A amuhaymin
#SBATCH -J phpp
#SBATCH -N 20
#SBATCH --ntasks=2240
#SBATCH --cpus-per-task=1
#SBATCH --time=01-01:00:00
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err

export OMP_NUM_THREADS=1

echo "SLURM_NODELIST $SLURM_NODELIST"
echo "NUMBER OF CORES $SLURM_NTASKS"

rm -rf .gitignore
rm -rf .git
