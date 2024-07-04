#!/bin/bash
#SBATCH -p LocalQ
#SBATCH -A abdul
#SBATCH -J Fe
#SBATCH -N 1
#SBATCH -n 10
#SBATCH --time=0-05:00:00
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=abdulmuhaymin@alumni.bilkent.edu.tr

export OMP_NUM_THREADS=1

echo "SLURM_NODELIST $SLURM_NODELIST"
echo "NUMBER OF CORES $SLURM_NTASKS"


pwtk ecutwfc.slurm.1.pwtk > ecutwfc.slurm.1.pwtk.log 2>&1


