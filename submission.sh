#!/bin/bash -l
#SBATCH -N 1
#SBATCH --ntasks-per-node=20
#SBATCH -t 10:00:00
#SBATCH --job-name=ALK1_01
#SBATCH -e stderr-name
#SBATCH -o stdout-name
#SBATCH  --gres=gpu:a40:1
#SBATCH  -p preempt-gpu
#SBATCH --mem=15g


export OMP_NUM_THREADS=4


module purge
module use /home/sarupria/shared/software/ModuleFiles/modules/linux-centos7-haswell

module load gromacs/2020.3-gcc/8.2.0-nompi-openmp-cuda10_2


cd $SLURM_SUBMIT_DIR
./RunSimulation.sh
./NoPbc_CG3.sh CASP_K2_55_CG3 01
./NoPbc_CG3_water.sh CASP_K2_55_CG3 01
./Count_water.sh CASP_K2_55_CG3 01
