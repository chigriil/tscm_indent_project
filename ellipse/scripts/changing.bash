#!/bin/bash


node=$(srun -N 8 -p RT hostname | tail -n )1
#SBATCH -N 1
#SBATCH --ntasks-per-node=1 # MPI process
#SBATCH --partition=RT
#SBATCH --nodelist=$node

cd ..
cd data
cd changing_k


for i in {0..4}
do
	cd $i
	srun  ~/bin/lmp_mpi -in ~/ellipse/data/changing_k/$i/in.indent
	echo "-- -- finished"
	
	
	cd ..

done


