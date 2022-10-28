#!/bin/bash
#SBATCH --account=def-pawilson
#SBATCH --job-name=index
#SBATCH --mem=4GB
#SBATCH --time=0-01:00

module load samtools

samtools index ${1}_NoDupsRG_filtered_clip.bam
