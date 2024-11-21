#! /bin/bash

#$ -cwd
#$ -j n
#$ -r y
#$ -hard
# -m e
#$ -M gaozm@ust.hk
#$ -S /bin/bash
#$ -N meta-rRNA

export PATH=/home/gaozm/packages/rRNA_prediction/rRNA_hmm_fs_wst_v0:$PATH;
../scripts/rRNA_hmm_run_wst_v0.pl  input.1 output.1;
