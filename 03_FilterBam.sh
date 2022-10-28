## quality filtering for bam
# depending on your analyses, you may want to move this step to a later point or skip it all together

#!/bin/bash
#SBATCH --account=def-pawilson
#SBATCH --job-name=filter-reads
#SBATCH --cpus-per-task=4
#SBATCH --mem=16GB
#SBATCH --time=0-03:00

module load samtools

samtools view -b -q 20 ${1}.sorted.bam > ${1}_filtered.sorted.bam
