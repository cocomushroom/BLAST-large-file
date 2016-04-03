##These script deal with files containing large amount of sequences that take a long time to BLAST.##

1) Divide assembled transcripts into many many files, Need to change fasta file name in the script
python split_bigfile.py

2) submit multiple jobs on cluster. Notice all of the transcripts files have to be in the same folder
./ subMultiBLAST.sh

3) After all the BLASTed search, the results are saved in .xml format in .NROut files, extract the transcripts that BLASTED to FungalNR database, When ran on slurm Cluster: 
sbatch List_BLAST.sh

5) When on mac computer:
./BLASTxml_query_grep

6) After obtain the list of transcript names, use the names to extract transcript sequences from the original assembled transcript file
python extract_byID.py “inputname" "list" "outputname"

7) Use the extracted sequences to do the downstream analyses
Status API Training Shop Blog About

