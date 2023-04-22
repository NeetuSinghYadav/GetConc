#!/bin/bash

NAME=CASP_K2
NUM=55
Conc=01

gmx grompp -f minim.mdp -p ${NAME}_CG3.top -c ${NAME}_${NUM}_CG3_${Conc}_Water.gro -o ${NAME}_${NUM}_CG3_${Conc}_min.tpr -maxwarn 1 
gmx mdrun -deffnm ${NAME}_${NUM}_CG3_${Conc}_min -ntmpi 4 -ntomp 4 


gmx grompp -f Martini_npt1.mdp -p ${NAME}_CG3.top -c ${NAME}_${NUM}_CG3_${Conc}_min.gro -o ${NAME}_${NUM}_CG3_${Conc}_npt1_eq.tpr -maxwarn 2
gmx mdrun -deffnm ${NAME}_${NUM}_CG3_${Conc}_npt1_eq -ntmpi 4 -ntomp 4 


gmx grompp -f Martini_npt.mdp -p ${NAME}_CG3.top -c ${NAME}_${NUM}_CG3_${Conc}_npt1_eq.gro -o ${NAME}_${NUM}_CG3_${Conc}_npt_eq.tpr -maxwarn 2
gmx mdrun -deffnm ${NAME}_${NUM}_CG3_${Conc}_npt_eq  -ntmpi 4 -ntomp 4

rm \#*

