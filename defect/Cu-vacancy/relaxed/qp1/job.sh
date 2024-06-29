#!/bin/bash
#SBATCH -M arf
#SBATCH -p orfoz
#SBATCH -A amuhaymin
#SBATCH -J CuVqp1rlx
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

###mpirun pw.x -npool 5 -i 1.Cu_vac_in_ZnS.relax.qp1.in.part1 > 1.Cu_vac_in_ZnS.relax.qp1.out.part1
###mpirun pw.x -npool 5 -i 1.Cu_vac_in_ZnS.relax.qp1.in.part2 > 1.Cu_vac_in_ZnS.relax.qp1.out.part2
mpirun pw.x -npool 5 -i 2.Cu_vac_in_ZnS.scf.qp1.in > 2.Cu_vac_in_ZnS.scf.qp1.out