#!/bin/bash

node=$(srun -N 8 -p RT hostname | tail -n )1
  
#SBATCH -N 1
#SBATCH --ntasks-per-node=1 # MPI process
#SBATCH --partition=RT
#SBATCH --nodelist=$node


cd ~/ellipse/data/data_1000000


srun  ~/bin/lmp_mpi -in ~/ellipse/data/data_1000000/in.indent
