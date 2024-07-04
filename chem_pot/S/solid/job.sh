#!/bin/bash
#SBATCH -M truba
#SBATCH -p hamsi
#SBATCH -A amuhaymin
#SBATCH -J ZnS
#SBATCH -N 1
#SBATCH -n 28
#SBATCH --time=0-10:00:00
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=abdulmuhaymin@alumni.bilkent.edu.tr

export OMP_NUM_THREADS=1

echo "SLURM_NODELIST $SLURM_NODELIST"
echo "NUMBER OF CORES $SLURM_NTASKS"

module purge
module load centos7.3/comp/intel/PS2018-update2
module load centos7.9/app/espresso/7.2-impi-oneapi-2022.2-GOLD

ESPRESSO_DIR=/truba/sw/centos7.9/app/espresso/7.2-impi-oneapi-2022.2-GOLD/

mpirun $ESPRESSO_DIR/bin/pw.x < vc-relax.in > vc-relax.out

exit
