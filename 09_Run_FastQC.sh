mkdir fastqc_slurm

for f in $(ls *.realigned.bam | cut -f1-1 -d'.'| uniq)
do
echo ${f}
sbatch -o ./fastqc_slurm/${f}-%A.out fastqc.sh ${f}
sleep 10
done

###TIP: use multiqc to look at all the fastqc output together
