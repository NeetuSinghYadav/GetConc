
module purge
module use /home/sarupria/shared/software/ModuleFiles/modules/linux-centos7-haswell

module load gromacs/2020.3-gcc/8.2.0-nompi-openmp-cuda10_2


NAME=$1
Run=$2

echo 1 |gmx trjconv -f ${NAME}_${Run}_npt1_eq.xtc -s ${NAME}_${Run}_npt1_eq.tpr -o ${NAME}_${Run}_npt_eq.pdb -dump 0

echo 1 |gmx trjconv -f ${NAME}_${Run}_npt_eq.xtc -s ${NAME}_${Run}_npt_eq.tpr -o ${NAME}_${Run}_npt_eq_LastFrame.pdb -dump -1

echo 1 |  gmx trjconv  -f ${NAME}_${Run}_npt_eq.xtc -s ${NAME}_${Run}_npt_eq.tpr -o ${NAME}_${Run}_protein_pbc_whole.xtc  -pbc whole

echo 1 | gmx trjconv  -f ${NAME}_${Run}_protein_pbc_whole.xtc -s ${NAME}_${Run}_npt_eq.tpr   -pbc nojump -o ${NAME}_${Run}_protein_nojump.xtc


echo 1 1 | gmx trjconv  -f ${NAME}_${Run}_protein_nojump.xtc -s ${NAME}_${Run}_npt_eq.pdb -pbc mol -center -o ${NAME}_${Run}_protein_final.xtc 


gmx sasa -f ${NAME}_${Run}_npt_eq.xtc  -s ${NAME}_${Run}_npt_eq.gro -o ${NAME}_${Run}_npt_sasa.xvg -surface 'group "Protein"' -probe 0.4
rm \#* *whole.xtc *inbox.xtc *nojump.xtc
