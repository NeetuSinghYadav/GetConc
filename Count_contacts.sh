
#module purge
#module use /home/sarupria/shared/software/ModuleFiles/modules/linux-centos7-haswell
#module load gromacs/2020.3-gcc/8.2.0-nompi-openmp-cuda10_2


NAME=$1
Run=$2

echo 0 1 | gmx mindist -f  ${NAME}_${Run}_protein_final_water.xtc  -s ${NAME}_${Run}_npt_eq.tpr  -tu ns -n ${NAME}_${Run}_npt_eq_water.ndx -d 0.4 -on ${NAME}_${Run}_numcont_prot_wat.xvg  -group 

echo 0 2 | gmx mindist -f  ${NAME}_${Run}_protein_final_water.xtc  -s ${NAME}_${Run}_npt_eq.tpr  -tu ns -n ${NAME}_${Run}_npt_eq_water.ndx -d 0.4 -on ${NAME}_${Run}_numcont_prot_ion.xvg  -group 


#echo 0 2 | gmx mindist -f  ${NAME}_${Run}_protein_final_water.xtc  -s ${NAME}_${Run}_npt_eq.tpr  -tu ns -n ${NAME}_${Run}_npt_eq_water.ndx -d 0.4 -od ${NAME}_${Run}_mindist_prot_ion.xvg -on ${NAME}_${Run}_numcont_prot_ion.xvg -or ${NAME}_${Run}_mindistres_prot_ion.xvg -group 

rm \#*
