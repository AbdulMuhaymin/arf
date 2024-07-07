#!/bin/bash
#SBATCH -M arf
#SBATCH -p orfoz
#SBATCH -A amuhaymin
#SBATCH -J CoVqp1r
#SBATCH -N 7
#SBATCH --ntasks=784
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

######mpirun pw.x -npool 5 -i 1.Co_vac_in_ZnS.relax.qp1.in > 1.Co__vac_in_ZnS.relax.qp1.out

mpirun pw.x -npool 7 -i 2.Co_vac_in_ZnS.scf.qp1.in > 2.Co_vac_in_ZnS.scf.qp1.out

mpirun pw.x -npool 7 -i 3.Co_vac_in_ZnS.nscf.qp1.in > 3.Co_vac_in_ZnS.nscf.qp1.out

mpirun -np 112 pp.x < 4.pp.in > 4.pp.out
mpirun -np 112 dos.x < 5.dos.in > 5.dos.out
mpirun -np 112 projwfc.x < 6.projwfc.in > 6.projwfc.out

tar -czvf 6.pdos_files.tar.gz Co_vac_in_ZnS.qp1.pdos*
tar -tzvf 6.pdos_files.tar.gz
rm Co_vac_in_ZnS.qp1.pdos*
rm -rf out/*/*wfc*.hdf5