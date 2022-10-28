#!/bin/bash
#SBATCH --account=def-pawilson
#SBATCH --job-name=calc-coverage
#SBATCH --mem=4G
#SBATCH --time=0-01:00


module load samtools

samtools flagstat ${1}.realigned.bam > ./flagstat/${1}.realigned.bam.flagstat
samtools depth -a ${1}.realigned.bam > ./coverage/${1}.coverage
sleep 10
awk '{sum += $3} END {print "Average = ", sum/NR}' ./coverage/${1}.coverage > ./coverage/${1}.Average


