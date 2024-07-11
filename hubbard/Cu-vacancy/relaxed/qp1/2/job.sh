#!/bin/bash
#SBATCH -M arf
#SBATCH -p orfoz
#SBATCH -A amuhaymin
#SBATCH -J qp1HU2
#SBATCH -N 6
#SBATCH --ntasks=672
#SBATCH --cpus-per-task=1
#SBATCH --time=2-23:00:00
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err

export OMP_NUM_THREADS=1

echo "SLURM_NODELIST $SLURM_NODELIST"
echo "NUMBER OF CORES $SLURM_NTASKS"

module purge
source /arf/sw/comp/oneapi/2023.0/setvars.sh
module load lib/hdf5/1.14.3-oneapi-2023.0
module load apps/espresso/7.2-oneapi-2023.0

mpirun pw.x -npool 6 -i 1.Cu_vac_in_ZnS.relax.qp1.U.2.in > 1.Cu_vac_in_ZnS.relax.qp1.U.2.out
