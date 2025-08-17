## mitag_analysis: A tool for getting 16S rRNA (v4 zone) and 18S rRNA (v9 zone) seqence for analysising from metagenome and metatranscriptome.


## Dependencies
Python 3.10


Packages  | Version |
--------- | --------|
perl  | 5.32.1.1 |
seqkit  | 2.9.0 |
hmmer  | 3.4 |
biopython  | 1.84 |
pandas  | 2.2.3 |

## Installation
conda install heyinghui0722::mitag_analysis


## Run command 
mitag_analysis -i ./ -t 16S/18S -th 10

The mitag_analysis software is a tool designed for the extraction and analysis of 16S or 18S rDNA sequences from Illumina sequencing data. 

The command provided, mitag_analysis -i ./testdata -t 16S/18S -th 10, outlines the basic usage of the software with the following parameters:

    -i, --input_folderpath: This option specifies the parent directory that contains the folder with Illumina sequencing sequences. Within this directory, there should be a folder named illu that holds the sequences intended for 16S or 18S rDNA analysis. For example, This command tells the mitag_analysis software to look for the Illumina sequencing sequences in the illu folder within the testdata directory, and to perform the analysis on the testdata.fastq file for 16S or 18S rDNA sequences with 10 threads.

    -t, --type: This parameter is used to define the type of rDNA to be analyzed, which can be either 16S or 18S.

    -th, --thread: This option allows the user to set the number of threads to be used for the analysis, which can affect the processing speed. In the example command, the value is set to 10.

After processing, it will create an output folder within ./testdata to store the results of the analysis.

## An example:
mitag_analysis -i /mnt/data4/project/HYHsoftware240130/6_microbiome_18s/MG/extract18S/ -t 18S -th 60

Here, the input filepath is "/mnt/data4/project/HYHsoftware240130/6_microbiome_18s/MG/extract18S/", and a filefloder named "illu", which includes the metagenome sequence with .fastq suffix. We want to extract the 18S mitag, so the parameter behind the -t is 18S. Besides, we want to use 60 cores,  so the parameter behind the -th is 60.


## Optional arguments:
  -i --input_folderpath, The parent directory of the folder containing the Illumina sequencing sequences that need to be extracted. 
                  
  -t --type, Choose whether to extract 16SrDNA sequence and corresponding v4 region sequence or extract 18SrDNA    sequence and corresponding v9 region sequence from metagenome or metatranscriptome. You can type '18S' or '16S'.
                  
  -th --thread, The number of threads, default is 1.


## Output folder structure
The output folder structure for the mitag_analysis software typically includes several subfolders and files that organize the results of the 16S or 18S rDNA sequence analysis. While the exact structure can vary depending on the software version and specific options used, a common output folder structure might look something like this:


./input&output_folder/

├── illu/       # Contains the original metatranscriptomic or metagenomic data (for extracting v4 and v9 regions)

├── seqkit/     # Contains the fasta files converted from the fastq files in illu

├── rRNA_prediction/ # Contains the rRNA sequences extracted from illu

├── 16S/        # Contains the extracted 16S rRNA sequences

├── v4/         # Contains the fasta sequences of the v4 region of 16S rRNA

└── v4seq/      # Contains the fastq sequences of the v4 region of 16S rRNA



./input&output_folder/

├── illu/       # Contains the original metatranscriptomic or metagenomic data (for extracting v4 and v9 regions)

├── seqkit/     # Contains the fasta files converted from the fastq files in illu

├── rRNA_prediction/ # Contains the rRNA sequences extracted from illu

├── 18S/        # Contains the extracted 18S rRNA sequences

├── v9/         # Contains the fasta sequences of the v9 region of 18S rRNA

└── v9seq/      # Contains the fastq sequences of the v9 region of 18S rRNA


Development environment: Linux  
Development tool: Pycharm and VScode

## License
This project is licensed under the MIT License. See the LICENSE file for more information.

## Contact
If you have any questions, please feel free to contact: heyinghu23@mails.tsinghua.edu.cn

