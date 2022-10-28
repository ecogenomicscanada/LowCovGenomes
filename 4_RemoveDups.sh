#!/bin/bash
#SBATCH --account=def-pawilson
#SBATCH --job-name=remove-duplicates
#SBATCH --cpus-per-task=32
#SBATCH --mem=32GB
#SBATCH --time=0-03:00

module load StdEnv/2020
module load samtools
module load sambamba
module load gatk/4.2.4.0

gatk --java-options -Xmx30g MarkDuplicates -I ${1}_filtered.sorted.bam -REMOVE_DUPLICATES true -AS true -O ./${1}_NoDups_filtered.sorted.bam -M ./${1}_marked_dup_metrics.txt

