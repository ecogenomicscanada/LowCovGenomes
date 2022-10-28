mkdir clip_slurm
for f in $(ls *_NoDups_filtered.sorted.bam | sed 's/_NoDups_filtered.sorted.bam//' | sort -u)
do
echo ${f}
sbatch -o ./clip_slurm/${f}-%A.out ClipBams_5.sh ${f}
sleep 10
done

