#!/bin/bash
#SBATCH --account=def-pawilson
#SBATCH --job-name=indel_realign
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=0-03:00 # time (DD-HH:MM)

module load nixpkgs/16.09
module load gatk/3.8
module load sambamba


java -Xmx30G -jar $EBROOTGATK/GenomeAnalysisTK.jar \
-T RealignerTargetCreator \
--use_jdk_deflater --use_jdk_inflater \
-nt 16 \
-R /scratch/kirstens/lowcov_newONsamples/Dovetail_hirise_May2021_final_assembly.fasta \
-I WR_PW_${1}_L001_NoDupsRG_filtered_clip.bam \
-o ${1}.realign.intervals \
-rf BadMate

# rf BadMate endables a filter to ensure that only reads that are likely to be mapped in the right place will be used in analysis

sleep 10

java -Xmx30G -jar $EBROOTGATK/GenomeAnalysisTK.jar \
-T IndelRealigner \
--use_jdk_deflater --use_jdk_inflater \
-R /scratch/kirstens/lowcov_newONsamples/Dovetail_hirise_May2021_final_assembly.fasta \
-I WR_PW_${1}_L001_NoDupsRG_filtered_clip.bam \
-targetIntervals ${1}.realign.intervals \
-o ${1}.realigned.bam
