#!/bin/bash
#SBATCH --account=def-pawilson
#SBATCH --job-name=trimmomatic
#SBATCH --cpus-per-task=16
#SBATCH --mem=8G
#SBATCH --time=0-06:00

module load trimmomatic
java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.39.jar PE -threads 16 -phred33 ${1}_R1_001.fastq.gz ${1}_R2_001.fastq.gz \
${1}_R1_Trimmed_001.fastq.gz ${1}_R1_Unpaired_001.fastq.gz \
${1}_R2_Trimmed_001.fastq.gz ${1}_R2_Unpaired_001.fastq.gz \
ILLUMINACLIP:TruSeq3-PE-2.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
