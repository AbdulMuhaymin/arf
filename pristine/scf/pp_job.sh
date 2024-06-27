#!/bin/bash
#SBATCH -M arf
#SBATCH -p orfoz
#SBATCH -A amuhaymin
#SBATCH -J pp
#SBATCH -N 1
#SBATCH --ntasks=112
#SBATCH --cpus-per-task=1
#SBATCH --time=0-01:00:00
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err

export OMP_NUM_THREADS=1

echo "SLURM_NODELIST $SLURM_NODELIST"
echo "NUMBER OF CORES $SLURM_NTASKS"

module purge
source /arf/sw/comp/oneapi/2023.0/setvars.sh
module load lib/hdf5/1.14.3-oneapi-2023.0
module load apps/espresso/7.2-oneapi-2023.0

mpirun dos.x < 3.ZnS.dos.in > 3.ZnS.dos.out
mpirun projwfc.x < 4.ZnS.pdos.in > 4.ZnS.pdos.out
mpirun pp.x < 5.ZnS.V_pot_pp.in > 5.ZnS.V_pot_pp.out
