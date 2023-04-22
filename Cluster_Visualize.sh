NAME=$1

#gmx make_ndx -f ${NAME}_npt_eq.pdb -o ${NAME}_npt_eq.ndx << EOF
#       1
#       q
#EOF


#echo 1 | gmx clustsize -f ${NAME}_npt_eq.xtc -s ${NAME}_npt_eq.tpr  -o ${NAME}_npt_eq_cluster.xpm -dt 50  -cut 0.5 -nc ${NAME}_npt_eq_nclust.xvg -temp ${NAME}_npt_eq_temp.xvg -mcn ${NAME}_npt_eq_maxclust.ndx -hc ${NAME}_npt_eq_histo-clust.xvg -ac ${NAME}_npt_eq_avclust.xvg -mc ${NAME}_npt_eq_maxclust.xvg -n ${NAME}_npt_eq.ndx


echo 1 1 1 | gmx trjconv -f ${NAME}_npt_eq.gro -s ${NAME}_npt_eq.tpr -pbc cluster -center -o ${NAME}_npt_eq_clustered.gro


#echo 1 | gmx convert-tpr -s ${NAME}_npt_eq.tpr -n ${NAME}_npt_eq.ndx -nsteps -1 -o ${NAME}_npt_eq_noW.tpr


#echo 1 |gmx trjconv -f ${NAME}_npt_eq_clustered.gro -s ${NAME}_npt_eq_noW.tpr -n ${NAME}_npt_eq.ndx  -o ${NAME}_npt_eq_maxclust.gro 

#echo 1 |gmx convert-tpr -s ${NAME}_npt_eq_noW.tpr -n ${NAME}_npt_eq_maxclust.ndx -nsteps -1 -o ${NAME}_npt_eq_maxclust.tpr

echo 1 | gmx editconf -f ${NAME}_npt_eq_clustered.gro -princ -c -o ${NAME}_npt_eq_princ.gro


#echo 1 | gmx gyrate -f ${NAME}_npt_eq_princ.gro -s ${NAME}_npt_eq_maxclust.tpr -moi -o ${NAME}_npt_eq_gyrate.xvg
