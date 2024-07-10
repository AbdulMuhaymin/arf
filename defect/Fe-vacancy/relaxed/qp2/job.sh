#!/bin/bash
#SBATCH -M arf
#SBATCH -p orfoz
#SBATCH -A amuhaymin
#SBATCH -J FeVqp2r
#SBATCH -N 6
#SBATCH --ntasks=672
#SBATCH --cpus-per-task=1
#SBATCH --time=1-10:00:00
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err

export OMP_NUM_THREADS=1

echo "SLURM_NODELIST $SLURM_NODELIST"
echo "NUMBER OF CORES $SLURM_NTASKS"

module purge
source /arf/sw/comp/oneapi/2023.0/setvars.sh
module load lib/hdf5/1.14.3-oneapi-2023.0
module load apps/espresso/7.2-oneapi-2023.0

#####mpirun pw.x -npool 5 -i 1.Fe_vac_in_ZnS.relax.qp2.in > 1.Fe_vac_in_ZnS.relax.qp2.out

###mpirun pw.x -npool 7 -i 2.Fe_vac_in_ZnS.scf.qp2.in > 2.Fe_vac_in_ZnS.scf.qp2.out

mpirun pw.x -npool 6 -i 3.Fe_vac_in_ZnS.nscf.qp2.in > 3.Fe_vac_in_ZnS.nscf.qp2.out

mpirun -np 112 pp.x < 4.pp.in > 4.pp.out
mpirun -np 112 dos.x < 5.dos.in > 5.dos.out
mpirun -np 112 projwfc.x < 6.projwfc.in > 6.projwfc.out

tar -czvf 6.pdos_files.tar.gz Fe_vac_in_ZnS.qp2.pdos*
tar -tzvf 6.pdos_files.tar.gz
rm Fe_vac_in_ZnS.qp2.pdos*
rm -rf out/*/*wfc*.hdf5
