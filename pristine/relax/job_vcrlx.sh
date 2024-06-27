#!/bin/bash
#SBATCH -M arf
#SBATCH -p orfoz
#SBATCH -A amuhaymin
#SBATCH -J vrlx
#SBATCH -N 10
#SBATCH --ntasks=1120
#SBATCH --cpus-per-task=1
#SBATCH --time=0-01:00:00
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err

export OMP_NUM_THREADS=1

echo "SLURM_NODELIST $SLURM_NODELIST"
echo "NUMBER OF CORES $SLURM_NTASKS"

module purge
source /arf/sw/comp/oneapi/2023.0/setvars.sh
module load lib/hdf5/1.14.3-oneapi-2023.0
module load apps/espresso/7.2-oneapi-2023.0

cat > ZnS.vc_relax.in << EOF
&CONTROL
  calculation = 'vc-relax'
  outdir = './out/'
  prefix = 'vcrlx' 
  pseudo_dir = '/arf/home/amuhaymin/pseudo/' 
  verbosity = 'high'
  disk_io = 'none'
  etot_conv_thr = 1.0D-5
  forc_conv_thr = 1.0D-4
  tstress = .true.
  tprnfor = .true.
/
&SYSTEM
  ecutwfc = 150
  ecutrho = 600
  ibrav = 1
  a = 10.88441000000
  nat = 64
  ntyp = 2
  occupations = 'smearing'
  smearing = 'gauss'
  degauss = 0.001
  nspin = 2
  starting_magnetization(1) = 0.000000000000000
  starting_magnetization(2) = 0.000000000000000
/
&ELECTRONS
  conv_thr =   1d-08
/
&IONS
/
&CELL
/
ATOMIC_SPECIES
S      32.065 S.pbe-n-kjpaw_psl.1.0.0.UPF
Zn     65.38 Zn.pbe-dnl-kjpaw_psl.1.0.0.UPF
ATOMIC_POSITIONS crystal
Zn           0.0000000000       0.0000000000       0.0000000000 
Zn           0.0000000000       0.2500000000       0.2500000000 
Zn           0.2500000000       0.0000000000       0.2500000000 
Zn           0.2500000000       0.2500000000       0.0000000000 
S            0.1250000000       0.3750000000       0.3750000000 
S            0.1250000000       0.1250000000       0.1250000000 
S            0.3750000000       0.3750000000       0.1250000000 
S            0.3750000000       0.1250000000       0.3750000000 
Zn           0.0000000000       0.0000000000       0.5000000000 
Zn           0.0000000000       0.2500000000       0.7500000000 
Zn           0.2500000000       0.0000000000       0.7500000000 
Zn           0.2500000000       0.2500000000       0.5000000000 
S            0.1250000000       0.3750000000       0.8750000000 
S            0.1250000000       0.1250000000       0.6250000000 
S            0.3750000000       0.3750000000       0.6250000000 
S            0.3750000000       0.1250000000       0.8750000000 
Zn           0.0000000000       0.5000000000       0.0000000000 
Zn           0.0000000000       0.7500000000       0.2500000000 
Zn           0.2500000000       0.5000000000       0.2500000000 
Zn           0.2500000000       0.7500000000       0.0000000000 
S            0.1250000000       0.8750000000       0.3750000000 
S            0.1250000000       0.6250000000       0.1250000000 
S            0.3750000000       0.8750000000       0.1250000000 
S            0.3750000000       0.6250000000       0.3750000000 
Zn           0.0000000000       0.5000000000       0.5000000000 
Zn           0.0000000000       0.7500000000       0.7500000000 
Zn           0.2500000000       0.5000000000       0.7500000000 
Zn           0.2500000000       0.7500000000       0.5000000000 
S            0.1250000000       0.8750000000       0.8750000000 
S            0.1250000000       0.6250000000       0.6250000000 
S            0.3750000000       0.8750000000       0.6250000000 
S            0.3750000000       0.6250000000       0.8750000000 
Zn           0.5000000000       0.0000000000       0.0000000000 
Zn           0.5000000000       0.2500000000       0.2500000000 
Zn           0.7500000000       0.0000000000       0.2500000000 
Zn           0.7500000000       0.2500000000       0.0000000000 
S            0.6250000000       0.3750000000       0.3750000000 
S            0.6250000000       0.1250000000       0.1250000000 
S            0.8750000000       0.3750000000       0.1250000000 
S            0.8750000000       0.1250000000       0.3750000000 
Zn           0.5000000000       0.0000000000       0.5000000000 
Zn           0.5000000000       0.2500000000       0.7500000000 
Zn           0.7500000000       0.0000000000       0.7500000000 
Zn           0.7500000000       0.2500000000       0.5000000000 
S            0.6250000000       0.3750000000       0.8750000000 
S            0.6250000000       0.1250000000       0.6250000000 
S            0.8750000000       0.3750000000       0.6250000000 
S            0.8750000000       0.1250000000       0.8750000000 
Zn           0.5000000000       0.5000000000       0.0000000000 
Zn           0.5000000000       0.7500000000       0.2500000000 
Zn           0.7500000000       0.5000000000       0.2500000000 
Zn           0.7500000000       0.7500000000       0.0000000000 
S            0.6250000000       0.8750000000       0.3750000000 
S            0.6250000000       0.6250000000       0.1250000000 
S            0.8750000000       0.8750000000       0.1250000000 
S            0.8750000000       0.6250000000       0.3750000000 
Zn           0.5000000000       0.5000000000       0.5000000000 
Zn           0.5000000000       0.7500000000       0.7500000000 
Zn           0.7500000000       0.5000000000       0.7500000000 
Zn           0.7500000000       0.7500000000       0.5000000000 
S            0.6250000000       0.8750000000       0.8750000000 
S            0.6250000000       0.6250000000       0.6250000000 
S            0.8750000000       0.8750000000       0.6250000000 
S            0.8750000000       0.6250000000       0.8750000000
K_POINTS automatic
4 4 4 0 0 0
EOF

mpirun pw.x -npool 10 < ZnS.vc_relax.in > ZnS.vc_relax.out
