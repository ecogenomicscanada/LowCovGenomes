
for f in $(ls *_NoDupsRG_filtered_clip.bam | cut -f1-5 -d'_' | uniq)
do
echo ${f}
sbatch -o ./${f}-%A.out indexbam.sh ${f}
sleep 10
done
