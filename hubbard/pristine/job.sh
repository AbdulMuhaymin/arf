#!/bin/bash
#SBATCH -M arf
#SBATCH -p orfoz
#SBATCH -A amuhaymin
#SBATCH -J ZnSU
#SBATCH -N 10
#SBATCH --ntasks=1120
#SBATCH --cpus-per-task=1
#SBATCH --time=2-20:00:00
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err

export OMP_NUM_THREADS=1


echo "SLURM_NODELIST $SLURM_NODELIST"
echo "NUMBER OF CORES $SLURM_NTASKS"

module purge

source /arf/sw/comp/oneapi/2023.0/setvars.sh
module load lib/hdf5/1.14.3-oneapi-2023.0
module load apps/espresso/7.2-oneapi-2023.0

for Ud in 0.000001 1 2 3 4 5 6 7 8 9 10; do
mkdir Ud.$Ud
cd Ud.$Ud
for Up in 0.000001 1 2 3 4 5 6 7 8 9 10; do
mkdir Up.$Up
cd Up.$Up

cp ../../template.in 1.scf.Ud.$Ud.Up.$Up.in
echo "U Zn-3d $Ud" >> 1.scf.Ud.$Ud.Up.$Up.in
echo "U S-3p $Up" >> 1.scf.Ud.$Ud.Up.$Up.in

mpirun pw.x -npool 10 < 1.scf.Ud.$Ud.Up.$Up.in > 1.scf.Ud.$Ud.Up.$Up.out
echo "SCF done for Ud=$Ud, Up=$Up"

cp ../../nscf_template.in 2.nscf.Ud.$Ud.Up.$Up.in
echo "U Zn-3d $Ud" >> 2.nscf.Ud.$Ud.Up.$Up.in
echo "U S-3p $Up" >> 2.nscf.Ud.$Ud.Up.$Up.in
mpirun pw.x -npool 10 < 2.nscf.Ud.$Ud.Up.$Up.in > 2.nscf.Ud.$Ud.Up.$Up.out

cp ../../projwfc.in projwfc.Ud.$Ud.Up.$Up.in
mpirun -np 112 projwfc.x < projwfc.Ud.$Ud.Up.$Up.in > projwfc.Ud.$Ud.Up.$Up.out

rm -rf out
cd ..
done
cd ..
done

exit
