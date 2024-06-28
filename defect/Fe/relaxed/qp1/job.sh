#!/bin/bash
#SBATCH -M arf
#SBATCH -p orfoz
#SBATCH -A amuhaymin
#SBATCH -J rlxqp1Fe
#SBATCH -N 5
#SBATCH --ntasks=560
#SBATCH --cpus-per-task=1
#SBATCH --time=0-10:00:00
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err

export OMP_NUM_THREADS=1

echo "SLURM_NODELIST $SLURM_NODELIST"
echo "NUMBER OF CORES $SLURM_NTASKS"

module purge
source /arf/sw/comp/oneapi/2023.0/setvars.sh
module load lib/hdf5/1.14.3-oneapi-2023.0
module load apps/espresso/7.2-oneapi-2023.0


mpirun pw.x -npool 5 -i 1.Fe_in_ZnS.relax.qp1.in > 1.Fe_in_ZnS.relax.qp1.out
###mpirun pw.x -npool 10 -i 2.Fe_in_ZnS.scf.qp1.in > 2.Fe_in_ZnS.scf.qp1.out
