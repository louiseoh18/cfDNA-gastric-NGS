# UPDATED BY IRENE CHOI 20 Apr 2023

#!/bin/bash
#$ -cwd
# error = Merged with joblog
#$ -o /u/scratch/l/loh/joblog/BERT/BERT.$JOB_ID
#$ -j y
# Edit the line below as needed
#$ -l h_rt=4:00:00,h_data=30G
# Add multiple cores/nodes as needed:
#$ -pe shared 4
# Email address to notify
#$ -M $USER@mail
# Notify when
#$ -m bea


# load the job environment:
source /u/local/Modules/default/init/modules.sh
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/u/home/l/loh/fastaRegexFinder.py:~/.local/bin


# echo job info on joblog:
echo " " 
echo "Job $JOB_ID ended on:   " `hostname -s`
echo "Job $JOB_ID ended on:   " `date `
echo " "
echo $2

mkdir $1$2"_BERT/"

# convert bam to bed
module load bedtools
bedtools bamtobed -i $1$2"_blacklisted.bam" > $1$2"_BERT/"$2".bed"

echo "___________BAM2BED___________"

# convert bed to fasta
bedtools getfasta -fi /u/scratch/l/loh/GRCh38_lambda3.fa -bed $1$2"_BERT/"$2".bed" -fo $1$2"_BERT/"$2"_BERT.fasta"
ls -latr

echo "___________BED2FASTA___________"

