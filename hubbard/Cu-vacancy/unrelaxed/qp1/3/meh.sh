#!/bin/bash
#SBATCH -M arf
#SBATCH -p orfoz
#SBATCH -A amuhaymin
#SBATCH -J U3unr
#SBATCH -N 13
#SBATCH --ntasks=1456
#SBATCH --cpus-per-task=1
#SBATCH --time=2-23:00:00
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err

export OMP_NUM_THREADS=1

echo "SLURM_NODELIST $SLURM_NODELIST"
echo "NUMBER OF CORES $SLURM_NTASKS"

rm out/*.hub*
rm out/*/wfc*.hdf5
rm Cu_vac_in_ZnS.qp1.unrlxd.U3.pdos*
rm Cu_vac_in_ZnS.qp1.unrlxd.U3.pp

