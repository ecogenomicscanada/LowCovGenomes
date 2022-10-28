#!/bin/bash
#SBATCH --account=def-pawilson
#SBATCH --job-name=angsd
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kirstensolmundson@trentu.ca
#SBATCH --mem=0
#SBATCH --cpus-per-task=32
#SBATCH --time=02-22:00

## files need to be indexed

ls ./*.bam > bam.filelist

module load angsd

sleep 10

angsd -b bam.filelist -doMajorMinor 1 -domaf 1 -doBcf 1 -out ONcaribou.angsd -nThreads 32 -doGeno 4 -doPost 1 -gl 2 -SNP_pval 1e-6 -minMapQ 20 -minQ 20 -doCounts 1 -skipTriallelic 1 -doGlf 2

sleep 5

#thresholds may need to be adjusted for various data - here using moderate thresholds of base quality and mapping quality = 20
#note this one line runs on all of the bams at once ## therefore there is no "Run" script for this step to loop over bam files
