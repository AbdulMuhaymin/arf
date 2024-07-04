#!/bin/bash
#SBATCH -M truba
#SBATCH -p debug
#SBATCH -A amuhaymin
#SBATCH -J Zn
#SBATCH -N 1
#SBATCH -n 20
#SBATCH --time=0-00:10:00
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

for a in 5.10; do
for c in 9.20; do
c_by_a=$(echo "scale=2; $c/$a" | bc)

cat > Zn.a.$a.c.$c.in << EOF
&CONTROL
  calculation = 'scf'
  outdir = './out/'
  prefix = 'Zn'
  pseudo_dir      =  '/truba/home/amuhaymin/ZnS/pseudo/QE/'
  verbosity       =  'high'
 /

&SYSTEM
  degauss =   5d-04
  ecutwfc =   70
  ecutrho = 280
  ibrav = 4
  celldm(1) = $a
  celldm(3) = $c_by_a
  nat = 2
  ntyp = 1
  occupations = 'smearing'
  smearing = 'cold'
  nspin = 2
  starting_magnetization=0.0000001
/
&ELECTRONS
  conv_thr =   4.0000000000d-6
/
ATOMIC_SPECIES
Zn     65.38 Zn.pbe-dnl-kjpaw_psl.1.0.0.UPF 
K_POINTS automatic
14 14 7 0 0 0
ATOMIC_POSITIONS crystal
  Zn       0.333333330000   0.666666670000   0.250000000000
  Zn       0.666666670000   0.333333330000   0.750000000000
EOF

mpirun $ESPRESSO_DIR/bin/pw.x < Zn.a.$a.c.$c.in > Zn.a.$a.c.$c.out-new

done 
done
