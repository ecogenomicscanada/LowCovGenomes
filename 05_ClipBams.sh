#!/bin/bash
#SBATCH --account=def-pawilson
#SBATCH --job-name=clip_bams
#SBATCH --cpus-per-task=4
#SBATCH --mem=8GB
#SBATCH --time=0-03:00
module load bamutil/1.0.14
bam clipOverlap --in ${1}_NoDups_filtered.sorted.bam --out ${1}_NoDupsRG_filtered_clip.bam --stats
