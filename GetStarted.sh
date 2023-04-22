#!/bin/bash

NAME=$1
NUM=$2
BOXSIZE=$3
Conc=0.1
Concstr=01

tleap -f leaprc.in
martinize2  -f ${NAME}.pdb -x ${NAME}_CG3.pdb -o ${NAME}_CG3.top -nt 
sed -i 's/molecule_0/'${NAME}'/g'  molecule_0.itp

cp molecule_0.itp ${NAME}.itp

sed -i '9s/1/'${NUM}'/' ${NAME}_CG3.top
sed -i 's/molecule_0/'${NAME}'/g' ${NAME}_CG3.top


gmx insert-molecules -box ${BOXSIZE} ${BOXSIZE} ${BOXSIZE}  -nmol ${NUM} -ci ${NAME}_CG3.pdb -radius 0.2 -o ${NAME}_CG3_box.gro
gmx solvate -cp ${NAME}_CG3_box.gro -cs water_1.gro -radius 0.1 -o ${NAME}_CG3_Water.gro -p ${NAME}_CG3.top

sed -i '1d' ${NAME}_CG3.top
sed -i '1a\#include "martini_v3.0.0.itp"' ${NAME}_CG3.top
sed -i '2a #include "martini_v3.0.0_solvents_v1.itp"' ${NAME}_CG3.top
sed -i '3a #include "martini_v3.0.0_ions_v1.itp"' ${NAME}_CG3.top
sed -i '1d' ${NAME}_CG3.top
gmx grompp -f minim.mdp -p ${NAME}_CG3.top -c ${NAME}_CG3_Water.gro -o ${NAME}_${NUM}_CG3_genion.tpr
echo 13 | gmx genion -s ${NAME}_${NUM}_CG3_genion.tpr -pname NA -nname CL -conc ${Conc} -o ${NAME}_${NUM}_CG3_${Concstr}_Water.gro -p ${NAME}_CG3.top -neutral

rm \#*
