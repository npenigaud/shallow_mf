#!/bin/bash
#SBATCH -N1
#SBATCH -p ndl
#SBATCH --time 00:10:00
#SBATCH --gres=gpu:4
#SBATCH --exclusive
#SBATCH --switches=3

set -x

ulimit -s unlimited
export OMP_STACKSIZE=4G
export OMP_NUM_THREADS=8

SUBMIT_DIR=./smf.$$
mkdir $SUBMIT_DIR
cd $SUBMIT_DIR

#arch=cpu_intel_d
arch=gpu_nvhpc_d

##for method in openaccsinglecolumn
##do
##../compile.${arch}/main_shallow_mf.x  \
##  --case-in /home/gmap/mrpm/penigaudn/pack/50_shallow_mfT1rc.02.IMPIIFCI2302REPRODP.y/datawrapper/ \
##  --case-out /home/gmap/mrpm/penigaudn/shallow_mf/data_gpu/ \
##  --verbose  --diff  \
##  --method $method > $method.txt 2>&1
##done

for method in openmp openmpsinglecolumn openaccsinglecolumn
do
../compile.${arch}/main_shallow_mf.x  \
  --case-in /home/gmap/mrpm/penigaudn/shallow_mf/data_gpu/ \
  --verbose  --diff  \
  --nproma 64        \
  --method $method > $method.txt 2>&1
done

##for method in openmp openmpsinglecolumn openaccsinglecolumn
##do
##../compile.${arch}/main_shallow_mf.x  \
##  --case-in /home/gmap/mrpm/penigaudn/shallow_mf/data_small_gpu/ \
##  --verbose  --diff  \
##  --nproma 64        \
##  --method $method > $method.txt 2>&1
##done
