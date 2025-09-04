
# LOUISE


# convert bam to bed
module load bedtools
bedtools bamtobed -i $1$2".bam" > $1$2"_gquad/"$2".bed"

echo "___________BAM2BED___________"

# convert bed to fasta
bedtools getfasta -fi /u/scratch/l/loh/GRCh38_lambda3.fa -bed $1$2"_gquad/"$2".bed" -fo $1$2"_gquad/"$2"_gquad.fasta"
ls -latr

echo "___________BED2FASTA___________"



chmod 777 /u/scratch/l/loh/delfi.py 

chmod 777 /u/home/l/loh/fastaRegexFinder.py
# for permission, then run all the qsubs

$ python fast2csv.py input.fa output.csv

qsub /u/home/l/loh/run_bert.sh /u/scratch/l/loh/gc/ S-H10_S40_L002
qsub /u/home/l/loh/run_bert.sh /u/scratch/l/loh/gc/ S-H9_S39_L002
qsub /u/home/l/loh/run_bert.sh /u/scratch/l/loh/gc/ S-H8_S38_L002
qsub /u/home/l/loh/run_bert.sh /u/scratch/l/loh/gc/ S-H7_S37_L002
qsub /u/home/l/loh/run_bert.sh /u/scratch/l/loh/gc/ S-H6_S36_L002
qsub /u/home/l/loh/run_bert.sh /u/scratch/l/loh/gc/ S-H5_S35_L002
qsub /u/home/l/loh/run_bert.sh /u/scratch/l/loh/gc/ S-H4_S34_L002
qsub /u/home/l/loh/run_bert.sh /u/scratch/l/loh/gc/ S-H3_S33_L002
qsub /u/home/l/loh/run_bert.sh /u/scratch/l/loh/gc/ S-H2_S32_L002
qsub /u/home/l/loh/run_bert.sh /u/scratch/l/loh/gc/ S-H1_S31_L002


# job.q = check status
# st 
# eqw = error

tail -n 10 /u/home/l/loh/joblogs_TME/gquad/gquad.42824  # first 20 lines from top
tail -n 10 /u/scratch/l/loh/gc/S-H10_S40_L002_BERT/S-H10_S40_L002_BERT.csv

# gquad
find /u/scratch/l/loh/ -type f -name "*_TME_count.txt" -exec mv {} /u/scratch/l/loh/gquad_TME/ \;
find /u/scratch/l/loh/ -type f -name "*_TME_total.txt" -exec mv {} /u/scratch/l/loh/gquad_TME/ \;

# endmotif
find /u/scratch/l/loh/ -type f -name "*_TME_endmotif_ordered.csv" -exec mv {} /u/scratch/l/loh/endmotif_TME/ \;

# delfi
find /u/scratch/l/loh/ -type f -name "*_TME.sam_delfi_frag.csv" -exec mv {} /u/scratch/l/loh/delfi_TME/ \;


python endmotif_concatenator.py /u/scratch/l/loh/endmotif_TME/ /u/scratch/l/loh/endmotif_TME/endmotif.txt

python delfi_parse.py /u/scratch/l/loh/delfi_TME/ /u/scratch/l/loh/delfi_parse_TME/
python delfi_concatenator.py /u/scratch/l/loh/delfi_parse_TME/ /u/scratch/l/loh/delfi_parse_TME/delfi_TME.txt

python gquad_parse.py /u/scratch/l/loh/gquad_TME/ /u/scratch/l/loh/gquad_TME/count_TME.txt /u/scratch/l/loh/gquad_TME/total_TME.txt /u/scratch/l/loh/gquad_TME/perc_TME.txt 