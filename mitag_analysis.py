#!/usr/bin/env python

import argparse
import os
import sys

def main():
    parser = argparse.ArgumentParser(description="mitag_analysis: A package for running 16S rRNA and 18S rRNA analysis")
    parser.add_argument("-i", "--input_folderpath", help="The parent directory of the folder containing the Illumina sequencing sequences that need to be extracted.", required=True)
    parser.add_argument("-t", "--type", help="Choose whether to extract 16SrDNA sequence and corresponding v4 region sequence or extract 18SrDNA sequence and corresponding v9 region sequence from metagenome or metatranscriptome. You can type '18S' or '16S'.", required=True)
    parser.add_argument("-th", "--thread",help="The number of threads, default is 1", type=int, default=1,required=False)

    args = parser.parse_args()

    input_dir = os.path.abspath(args.input_folderpath)
    analysis_type = args.type

    script_path = os.path.dirname(os.path.realpath(__file__))
    thread = args.thread

    if analysis_type == "18S":
        cmd = f'bash {script_path}/mitag_analysis-command/running18S.sh {input_dir} {thread}'
    elif analysis_type == "16S":
        cmd = f'bash {script_path}/mitag_analysis-command/running16S.sh {input_dir} {thread}'
    else:
        print("Please indicate the type, you can input '16S' or '18S'")
        sys.exit(1)

    print(cmd)
    os.system(cmd)

if __name__ == '__main__':
    main()