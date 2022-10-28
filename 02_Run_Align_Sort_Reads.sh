mkdir mapped_slurm
mkdir sorted_mapped


#always check that the underscores are in the right places depending on your file names
for f in $(ls *_001.fastq.gz | cut -f1-5 -d'_'| uniq)

do
echo ${f}

sbatch -o ./mapped_slurm/${f}-%A.out Align_Sort_Reads.sh ${f}

done
