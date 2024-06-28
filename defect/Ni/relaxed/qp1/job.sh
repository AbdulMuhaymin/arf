#!/bin/bash
#SBATCH -M arf
#SBATCH -p orfoz
#SBATCH -A amuhaymin
#SBATCH -J Coqn1
#SBATCH -N 10
#SBATCH --ntasks=1120
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

###mpirun pw.x -npool 5 < 1.Co_in_ZnS.relax.qn1.in.part1 > 1.Co_in_ZnS.relax.qn1.out.part1
###mpirun pw.x -npool 5 < 1.Co_in_ZnS.relax.qn1.in.part2 > 1.Co_in_ZnS.relax.qn1.out.part2
mpirun pw.x -npool 10 -i 2.Co_in_ZnS.scf.qn1.in > 2.Co_in_ZnS.scf.qn1.out
