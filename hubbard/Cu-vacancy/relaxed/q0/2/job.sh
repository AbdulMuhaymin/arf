#!/bin/bash
#SBATCH -M arf
#SBATCH -p orfoz
#SBATCH -A amuhaymin
#SBATCH -J q0U2r
#SBATCH -N 13
#SBATCH --ntasks=1456
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

#####mpirun pw.x -npool 7 -i 1.Cu_vac_in_ZnS.relax.q0.U.2.in.part1 > 1.Cu_vac_in_ZnS.relax.q0.U.2.out.part3

mpirun pw.x -npool 13 -i 2.Cu_vac_in_ZnS.scf.q0.U2.in > 2.Cu_vac_in_ZnS.scf.q0.U2.out
mpirun pw.x -npool 13 -i 3.Cu_vac_in_ZnS.nscf.q0.U2.in > 3.Cu_vac_in_ZnS.nscf.q0.U2.out

mpirun -np 112 pp.x < 4.pp.in > 4.pp.out
mpirun -np 112 dos.x < 5.dos.in > 5.dos.out
mpirun -np 112 projwfc.x < 6.projwfc.in > 6.projwfc.out
tar -czvf 6.pdos_files.tar.gz Cu_vac_in_ZnS.q0.U.2.pdos*
tar -tzvf 6.pdos_files.tar.gz
rm Cu_vac_in_ZnS.q0.U.2.pdos*
rm Cu_vac_in_ZnS.q0.U.2.pp

