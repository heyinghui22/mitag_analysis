#!/bin/bash

echo "Please bring input files into a folder named 'illu', and enter the illu pathway"
echo "The file must be in .fastq format"
echo "Only one single-end sequencing sequence is needed"

# Gets the absolute path of the current script
absolute_path=$(realpath "$0")

# Get the upper-level directory
parent_directory=$(dirname "$absolute_path")

# Gets the previous directory of the previous level
grandparent_directory=$(dirname "$parent_directory")

DATA_PATH="$1"
CORE_NUMBER="$2"

# Check if DATA_PATH exists
if [ ! -d "$DATA_PATH" ]; then
  echo "Error: DATA_PATH does not exist."
  exit 1
fi

cd "$DATA_PATH" || { echo "Error: Cannot change directory to $DATA_PATH"; exit 1; }

# Check if 'illu' directory exists
if [ ! -d "$DATA_PATH/illu" ]; then
  echo "Error: 'illu' directory not found in DATA_PATH."
  exit 1
fi

for filename in "$DATA_PATH/illu/"*; do
  basename="${filename##*/}"
  name="${basename%.*}"
  echo "$name" >> list1
done

mkdir -p seqkit
mkdir -p rRNA_prediction
mkdir -p 16S
mkdir -p v4
mkdir -p v4seq


for i in `less "$DATA_PATH/list1"`; do
    seqkit fq2fa "$DATA_PATH/illu/${i}.fastq" -o "$DATA_PATH/seqkit/${i}.fasta" -j "$CORE_NUMBER"
done

export PATH=${grandparent_directory}/mitag_analysis-scripts/rRNA_prediction/rRNA_hmm_fs_wst_v0:$PATH

${grandparent_directory}/mitag_analysis-scripts/rRNA_prediction/scripts/rRNA_hmm_run_wst_v0.pl "$CORE_NUMBER" "$DATA_PATH/seqkit/" "$DATA_PATH/rRNA_prediction"

for i in "$DATA_PATH/rRNA_prediction/"*seq; do
    a=${i##*/}
    b=${a%%.*}
    perl ${grandparent_directory}/mitag_analysis-scripts/tiqu16s.pl "$i" "$DATA_PATH/16S/$b.16s.fa"
done

for filename in "$DATA_PATH/16S"/*; do
  basename="${filename##*/}"
  name="${basename%.*}"
  echo "$name" >> list3
done

for i in `less "$DATA_PATH/list3"`; do
    hmmsearch --cpu "$CORE_NUMBER"4 --notextw --tblout "$DATA_PATH/16S/${i}_V4.txt" ${grandparent_directory}/mitag_analysis-scripts/rRNA_prediction/v4/pro_v4.hmm "$DATA_PATH/16S/${i}.fa"
    python ${grandparent_directory}/mitag_analysis-scripts/rRNA_prediction/scripts/fasta.hmmpick.large2.py "$DATA_PATH/16S/${i}.fa" "$DATA_PATH/16S/${i}_V4.txt"
done


mv "$DATA_PATH/16S/"*.hmmpick.fasta "$DATA_PATH/v4"


for i in `less "$DATA_PATH/list1"`; do
    python ${grandparent_directory}/mitag_analysis-scripts/quality_extract.py "$DATA_PATH/v4/${i}.16s.hmmpick.fasta" "$DATA_PATH/illu/${i}.fastq"
done

cd $DATA_PATH/v4/
rename .16s.hmmpick.fasta _v4.fasta *

mv "$DATA_PATH/v4/"*.txt "$DATA_PATH/v4seq"
rename .txt .fastq $DATA_PATH/v4seq/*
cd $DATA_PATH
rm -rf list1
rm -rf list3

echo "Output filepath is $DATA_PATH"

