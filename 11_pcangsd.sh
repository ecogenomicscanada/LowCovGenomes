#!/bin/bash
#SBATCH --account=def-pawilson
#SBATCH --time=0-02:59
#SBATCH --job-name=angsd_covmat
#SBATCH -c 32
#SBATCH --mem=200G

## I installed pcangsd in a virutal environment to reduce complications with Python depedencies on CC
# first load python and scipy-stack, then source virutal environment where pcangsd is installed and run job
module load python
module load scipy-stack
source ENV/bin/activate
pcangsd -b /path/FILENAME.angsd.beagle.gz -t 32 -o /path/pcangsd_out/FILENAME.pcangsd 

#add in the path and file name ## make sure output directory exists 
#if you want to test a known/suspected value of K, add -e 2 (for K=3) ## or -e 9 (for K=10)
