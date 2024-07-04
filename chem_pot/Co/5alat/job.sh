#!/bin/bash
#SBATCH -M truba
#SBATCH -p debug
#SBATCH -A amuhaymin
#SBATCH -J Co
#SBATCH -N 1
#SBATCH -n 20
#SBATCH --time=0-00:15:00
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

for a in $(seq 4.71 0.01 4.75); do
for c in $(seq 7.64 0.01 7.70); do
c_by_a=$(echo "scale=2; $c/$a" | bc)

cat > Co.a.$a.c.$c.in << EOF
&CONTROL
  calculation = 'scf'
  outdir = './out/'
  prefix = 'Co'
  pseudo_dir      =  '/truba/home/amuhaymin/ZnS/pseudo/QE/'
  verbosity       =  'high'
 /

&SYSTEM
  degauss =   1d-03
  ecutwfc =   110
  ecutrho = 450
  ibrav = 4
  celldm(1) = $a
  celldm(3) = $c_by_a
  nat = 2
  nspin =  2
  ntyp =  1
  occupations = 'smearing'
  smearing = 'gauss'
  nspin = 2
  starting_magnetization(1) =  0.29411764706
/
&ELECTRONS
   conv_thr        = 1e-6
   startingpot     =  'file'
   startingwfc     =  'file'
 /
ATOMIC_SPECIES 
  Co    58.933   Co.pbe-spn-kjpaw_psl.0.3.1.UPF 
ATOMIC_POSITIONS crystal
  Co       0.333333330000   0.666666670000   0.250000000000
  Co       0.666666670000   0.333333330000   0.750000000000
K_POINTS automatic
  12   12   6   0   0   0 
EOF

mpirun $ESPRESSO_DIR/bin/pw.x < Co.a.$a.c.$c.in > Co.a.$a.c.$c.out

done 
done
