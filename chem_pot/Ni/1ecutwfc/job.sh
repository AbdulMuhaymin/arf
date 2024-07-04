#!/bin/bash
#SBATCH -M truba
#SBATCH -p debug
#SBATCH -A amuhaymin
#SBATCH -J Ni_mu
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

for E in $(seq 140 10 180); do

cat > Ni.$E.in << EOF
&CONTROL
  calculation = 'scf'
  outdir = 'out'
  prefix = 'Ni'
  pseudo_dir = '/truba/home/amuhaymin/ZnS/pseudo/QE/'
  verbosity = 'high'
/
&SYSTEM
  degauss =   2.2049585400d-02
  ecutwfc =   $E
  ecutrho =   800
  ibrav = 0
  nat = 4
  nosym = .false.
  nspin = 2
  ntyp = 1
  occupations = 'smearing'
  smearing = 'mp'
  starting_magnetization(1) =   2.7777777778d-01
/
&ELECTRONS
  conv_thr =   8.0000000000d-8
  startingwfc='file'
  startingpot='file'
/
ATOMIC_SPECIES
Ni     58.6934 Ni.pbe-spn-kjpaw_psl.1.0.0.UPF
ATOMIC_POSITIONS crystal
Ni           0.0000000000       0.0000000000       0.0000000000 
Ni           0.0000000000       0.5000000000       0.5000000000 
Ni           0.5000000000       0.0000000000       0.5000000000 
Ni           0.5000000000       0.5000000000       0.0000000000 
K_POINTS automatic
12 12 12 0 0 0
CELL_PARAMETERS angstrom
      3.4751458700       0.0000000000       0.0000000000
      0.0000000000       3.4751458700       0.0000000000
      0.0000000000       0.0000000000       3.4751458700
EOF

mpirun $ESPRESSO_DIR/bin/pw.x < Ni.$E.in > Ni.$E.out

done 

for file in Ni.*.out; do
    # Extract the numerical value using grep and awk
    value=$(grep -oP '!    total energy\s+=\s+-?\d+.\d+' "$file" | awk '{print $NF}')
    
    # Extract the number from the file name
    number=$(echo "$file" | grep -oP '\d+')

    # Append the extracted values to data.out
    echo "$number  $value" >> data.out
done
