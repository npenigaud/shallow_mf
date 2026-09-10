#!/bin/bash

#source make.sh from shallow_mf directory

export BITREPCPP11=1

#INTELONEAPI="intel/oneapi/2023.2"
#COMPILER="compiler/2023.2.0"
#module load $INTELONEAPI    
#module load $COMPILER 
#module load gcc/9.2.0
module load nvidia/24.5 

#export PATH="$PWD/../actke49t2/fxtran-acdc/bin":$PATH ; export PATH=/home/sor/fxtran/master/bin:$PATH 

#export PATH="$PWD/../shallow_mf/fxtran-acdc_latest/bin":$PATH ; export PATH=/home/sor/fxtran/master/bin:$PATH 
#export PATH="$PWD/../shallow_mf/fxtran-acdc_count/bin":$PATH ; export PATH=/home/sor/fxtran/master/bin:$PATH 
export PATH="$PWD/../shallow_mf_filter/fxtran-acdc_filter/bin":$PATH ; export PATH=/home/sor/fxtran/master/bin:$PATH 

