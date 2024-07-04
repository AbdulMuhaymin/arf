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


for E in $(seq 80 10 140); do

cat > Co.$E.in << EOF
&CONTROL
  calculation = 'scf'
  outdir = './out/'
  prefix = 'Co'
  pseudo_dir = '/truba/home/amuhaymin/ZnS/pseudo/QE/'
  verbosity = 'high'
/
&SYSTEM
  degauss =   7.3498618000d-02
  ecutrho =   3.6000000000d+02
  ecutwfc =   $E
  ibrav = 0
  nat = 2
  nspin = 2
  ntyp = 1
  occupations = 'smearing'
  smearing = 'gauss'
  starting_magnetization(1) =  2.9411764706d-01
/
&ELECTRONS
  conv_thr =   8.0000000000d-8
  electron_maxstep = 80
  mixing_beta =   4.0000000000d-01
  startingwfc = 'file'
  startingpot = 'file'
/
ATOMIC_SPECIES
  Co   58.933   Co.pbe-spn-kjpaw_psl.0.3.1.UPF
ATOMIC_POSITIONS crystal
  Co       0.3333333300       0.6666666700       0.2500000000
  Co       0.6666666700       0.3333333300       0.7500000000
K_POINTS automatic
  15 15 8 0 0 0
CELL_PARAMETERS angstrom
  2.4719999000       0.0000000000       0.0000000000
 -1.2359999500       2.1408147116       0.0000000000
  0.0000000000       0.0000000000       4.0211440800
EOF

mpirun $ESPRESSO_DIR/bin/pw.x < Co.$E.in > Co.$E.out

done 
