import sys
from Bio import SeqIO
num=0
for seq in SeqIO.parse(sys.argv[1],"fastq"):
    num+=1
print num

