mkdir flagstat
mkdir coverage
mkdir coverage/depth_slurm

for f in $(ls *.realigned.bam | cut -f1-1 -d'.'| uniq)
do
echo ${f}
sbatch -o ./coverage/depth_slurm/${f}-%A.out coverage.sh ${f}
sleep 10
done
