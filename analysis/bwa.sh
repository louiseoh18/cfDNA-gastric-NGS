# UPDATED BY IRENE CHOI 30 Jun 2023

#!/bin/bash
#$ -cwd
# error = Merged with joblog
#$ -o /u/scratch/l/loh/joblog/exons.$JOB_ID
#$ -j y
# Edit the line below as needed
#$ -l h_rt=4:00:00,h_data=4G
# Add multiple cores/nodes as needed:
#$ -pe shared 4
# Email address to notify
#$ -M $USER@mail
# Notify when
#$ -m bea

# echo job info on joblog:
echo "Job $JOB_ID started on:   " `hostname -s`
echo "Job $JOB_ID started on:   " `date `
echo " "

# load the job environment:
source /u/local/Modules/default/init/modules.sh
export PATH=$PATH:~/.local/bin
module load python

module load bwa

bwa index /u/scratch/l/loh/GRCh38_lambda3.fa

echo " DONE "
