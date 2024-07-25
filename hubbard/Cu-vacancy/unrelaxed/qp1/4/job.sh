#!/bin/bash
#SBATCH -M arf
#SBATCH -p orfoz
#SBATCH -A amuhaymin
#SBATCH -J U4unr
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

mpirun pw.x -npool 13 -i 1.Cu_vac_in_ZnS.scf.qp1.unrlxd.U4.in > 1.Cu_vac_in_ZnS.scf.qp1.unrlxd.U4.out
mpirun pw.x -npool 13 -i 2.Cu_vac_in_ZnS.nscf.qp1.unrlxd.U4.in > 2.Cu_vac_in_ZnS.nscf.qp1.unrlxd.U4.out

mpirun -np 112 pp.x < 4.pp.in > 4.pp.out
mpirun -np 112 dos.x < 5.dos.in > 5.dos.out
mpirun -np 112 projwfc.x < 6.projwfc.in > 6.projwfc.out

rm out/*.hub*
rm out/*/wfc*.hdf5
tar -czvf 6.pdos_files.tar.gz Cu_vac_in_ZnS.qp1.unrlxd.U4.pdos*
tar -tzvf 6.pdos_files.tar.gz
rm Cu_vac_in_ZnS.qp1.unrlxd.U4.pdos*
rm Cu_vac_in_ZnS.qp1.unrlxd.U4.pp

