for f in $(ls *_filtered.sorted.bam | cut -f1-5 -d'_'| uniq)
do
echo ${f}
sbatch -o ./${f}-%A.out removedups.sh ${f}
sleep 10
done
