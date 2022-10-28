#!/bin/bash
#SBATCH --account=def-pawilson
#SBATCH --job-name=bwa-bam-sort
#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=0-12:00

module load samtools
module load bwa

R1=${1}_R1_Trimmed_001.fastq.gz
    SM=$(echo $R1 | cut -d"_" -f3,3)
    LB="471"
    PL="Illumina"
    RGID=$(zcat $R1 | head -n1 | sed 's/:/_/g' |cut -d "_" -f1,2,3,4)
    echo -e "@RG\tID:$RGID\tSM:$SM\tPL:$PL\tLB:$LB"

#add the directory to ref genome and proper ref name
bwa mem  -M -t 16 -R "@RG\tID:$RGID\tSM:$SM\tPL:$PL\tLB:$LB" /directory/withreferencegenome/REFERENCEGENOMENAME.fasta ${1}_R1_Trimmed_001.fastq.gz ${1}_R2_Trimmed_001.fastq.gz | \
samtools sort -@ 16 -o ./sorted_mapped/${1}.sorted.bam

