#!/bin/bash

#fxtran-makemaker --SRC=../src

INTELONEAPI="intel/oneapi/2023.2"
COMPILER="compiler/2023.2.0"
module load $INTELONEAPI    
module load $COMPILER 
module load gcc/9.2.0 

##export PATH=~marguina/fxtran-acdc/checker/bin:$PATH ; export PATH=~marguina/fxtran/master/bin:$PATH
export PATH=~/shallow_mf/fxtran-acdc/bin:$PATH ; export PATH=~/shallow_mf/fxtran/bin:$PATH


