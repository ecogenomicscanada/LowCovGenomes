#!/bin/bash
#SBATCH --account=def-pawilson
#SBATCH --job-name=fastqc
#SBATCH --mem=4G
#SBATCH --time=0-01:00


module load fastqc

fastqc ${1}.realigned.bam > ./fastqc_out/${1}.realigned.bam.fastqc
