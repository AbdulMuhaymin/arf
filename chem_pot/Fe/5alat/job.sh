#!/bin/bash
#SBATCH -M truba
#SBATCH -p debug
#SBATCH -A amuhaymin
#SBATCH -J Fe_mu
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

for a in $(seq 2.7 0.01 2.79); do

cat > Fe.$a.in << EOF
&CONTROL
  calculation = 'scf'
  outdir = './out/'
  prefix = 'Fe'
  pseudo_dir = '/truba/home/amuhaymin/ZnS/pseudo/QE/'
  verbosity = 'high'
/
&SYSTEM
  degauss =   0.001
  ecutrho =   700
  ecutwfc =   100
  ibrav = 1
  nat = 2
  a = $a
  nspin = 2
  ntyp = 1
  occupations = 'smearing'
  smearing = 'gauss'
  starting_magnetization(1) =   3.1250000000d-01
/
&ELECTRONS
  conv_thr =   4.0000000000d-10
  electron_maxstep = 80
  mixing_beta =   4.0000000000d-01
  startingwfc = 'file'
  startingpot = 'file'
/
ATOMIC_SPECIES
Fe     55.845 Fe.pbe-spn-kjpaw_psl.1.0.0.UPF
ATOMIC_POSITIONS crystal
Fe           0.0000000000       0.0000000000       0.0000000000 
Fe           0.5000000000       0.5000000000       0.5000000000 
K_POINTS automatic
10 10 10 0 0 0
EOF

mpirun $ESPRESSO_DIR/bin/pw.x < Fe.$a.in > Fe.$a.out

done 
