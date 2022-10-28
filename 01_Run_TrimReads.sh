mkdir trim_slurm

##may need to adjust where the underscores are cut - depending on raw file name from sequencer
##you can test first with echo to make sure you are taking the right file names before submitting the job

for f in $(ls *.fastq.gz | cut -f1-5 -d'_'| uniq)  
do
echo ${f}
sbatch -o ./trim_slurm/${f}-%A.out TrimReads_1.sh ${f}
sleep 10
done
