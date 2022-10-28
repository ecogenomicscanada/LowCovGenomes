
for f in $(ls *_NoDupsRG_filtered_clip.bam | cut -f3-4 -d'_'| uniq)
do
echo ${f}
sbatch -o ./${f}-%A.out indelrealign.sh ${f}
sleep 10
done
