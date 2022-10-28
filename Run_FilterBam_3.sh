mkdir filter_slurm

for f in $(ls *.sorted.bam | cut -f1-1 -d'.'| uniq)

do
echo ${f}
sbatch -o ./filter_slurm/${f}-%A.out filterbam.sh ${f}
sleep 5
done
