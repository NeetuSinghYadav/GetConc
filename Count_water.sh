
#module purge
#module use /home/sarupria/shared/software/ModuleFiles/modules/linux-centos7-haswell
#module load gromacs/2020.3-gcc/8.2.0-nompi-openmp-cuda10_2


NAME=$1
Run=$2

gmx make_ndx -f ${NAME}_${Run}_npt_eq_water.gro -o ${NAME}_${Run}_npt_eq_water.ndx << EOF
1 
13
14

name 15 Proteins
name 16 water
name 17 ions
del 0-14
q
EOF


gmx select -n  ${NAME}_${Run}_npt_eq_water.ndx -select 'group "water" and within 0.4 of group "Proteins"'  -f  ${NAME}_${Run}_protein_final_water.xtc  -s  ${NAME}_${Run}_npt_eq.tpr  -tu ns -os ${NAME}_${Run}_npt_eq_Num_water.xvg 


gmx select -n  ${NAME}_${Run}_npt_eq_water.ndx -select 'group "ions" and within 0.4 of group "Proteins"'  -f  ${NAME}_${Run}_protein_final_water.xtc  -s  ${NAME}_${Run}_npt_eq.tpr  -tu ns -os ${NAME}_${Run}_npt_eq_Num_ions.xvg 


rm \#*
