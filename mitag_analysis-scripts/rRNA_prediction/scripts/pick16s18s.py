#!/mnt/data/software/miniconda3/envs/1/bin/python
#coding=utf-8
import sys
#reload(sys)
#sys.setdefaultencoding("utf-8")
import re
from Bio import SeqIO


S=[]
for seq in SeqIO.parse(sys.argv[1],"fasta"):
    sample=sys.argv[1].split(".",-1)[0:len(sys.argv[1].split(".", -1))-1]
    type=re.findall("[\+|\-].*:(.*)_rRNA",seq.description)
    if type==[]:
        type = re.findall("Eukaryotic(.*)_rRNA", seq.description)
    S.append(type[0])
    #print sample,type[0],seq.description
sn=set(S)

for ss in sn:
    wr_ss=open("%s_%s.fasta"%(str(".".join(sample)),ss), "w")
    num = 1
    for seq in SeqIO.parse(sys.argv[1], "fasta"):
        sample = sys.argv[1].split(".", -1)[0:len(sys.argv[1].split(".", -1))-1]
        type = re.findall("[\+|\-].*:(.*)_rRNA", seq.description)
        if type == []:
            type = re.findall("Eukaryotic(.*)_rRNA", seq.description)
        if ss==type[0]:
            wr_ss.write(">%s_%s_%s\n%s\n" % (str(".".join(sample)), str(ss), str(num), str(seq.seq)))
            num+=1


