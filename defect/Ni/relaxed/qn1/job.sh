#!/bin/bash
#SBATCH -M arf
#SBATCH -p orfoz
#SBATCH -A amuhaymin
#SBATCH -J Niqn1
#SBATCH -N 1
#SBATCH --ntasks=112
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

###mpirun pw.x -npool 5 -i 1.Ni_in_ZnS.relax.qn1.in > 1.Ni_in_ZnS.relax.qn1.out
###mpirun pw.x -npool 10 -i 2.Ni_in_ZnS.scf.qn1.in > 2.Ni_in_ZnS.scf.qn1.out

###mpirun pw.x -npool 10 -i 3.Ni_in_ZnS.nscf.qn1.in > 3.Ni_in_ZnS.nscf.qn1.out

mpirun -np 112 pp.x < 4.pp.in > 4.pp.out
###mpirun -np 112 dos.x < 5.dos.in > 5.dos.out
###mpirun -np 112 projwfc.x < 6.projwfc.in > 6.projwfc.out

###tar -czvf 6.pdos_files.tar.gz Ni_in_ZnS.qn1.pdos*
###tar -tzvf 6.pdos_files.tar.gz
###rm Ni_in_ZnS.qn1.pdos*
###rm -rf out/*/*wfc*.hdf5
