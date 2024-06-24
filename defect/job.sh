#!/bin/bash
#SBATCH -M arf
#SBATCH -p orfoz
#SBATCH -A amuhaymin
#SBATCH -J phpp
#SBATCH -N 10
#SBATCH --ntasks=1120
#SBATCH --cpus-per-task=1
#SBATCH --time=01-01:00:00
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err

export OMP_NUM_THREADS=1

echo "SLURM_NODELIST $SLURM_NODELIST"
echo "NUMBER OF CORES $SLURM_NTASKS"

module purge

source /arf/sw/comp/oneapi/2023.0/setvars.sh
module load oneapi-2023
module load lib/hdf5/1.14.3-oneapi-2023.0

module load apps/espresso/7.2-oneapi-2023.0

###mpirun pw.x -npool 10 < Cu_ZnS_q0.relax.in > Cu_ZnS_q0.relax.out
###mpirun pw.x -npool 10 < Cu_ZnS_q0.scf.start_mag2.in > Cu_ZnS_q0.scf.start_mag2.out
mpirun pw.x -npool 10 < test2.in > test2.out
###mpirun pw.x -npool 10 < Cu_ZnS_q0.nscf.in > Cu_ZnS_q0.nscf.out
###mpirun projwfc.x < Cu_ZnS_q0.projwfc.in > Cu_ZnS_q0.projwfc.out

