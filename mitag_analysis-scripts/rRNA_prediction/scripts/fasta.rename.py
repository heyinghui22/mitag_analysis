#!/mnt/data/software/miniconda3/envs/1/bin/python
#coding=utf-8
import sys
#reload(sys)
#sys.setdefaultencoding("utf-8")

from Bio import SeqIO

sample =".".join(sys.argv[1].split(".",-1)[:(len(sys.argv[1].split(".",-1))-1)])
num=1
wr_ss=open("%s-%s.count.fasta"%(sys.argv[3],sample), "w")
wr_xls=open("%s-%s.xls"%(sys.argv[3],sample), "w")

for seq in SeqIO.parse(sys.argv[1],sys.argv[2]):
    wr_ss.write(">%s-%s_%s\n%s\n" % (str(sys.argv[3]),str(sample),str(num),str(seq.seq)))
    wr_xls.write("%s-%s_%s\t%s\t%s\n" % (str(sys.argv[3]),str(sample), str(num), str(seq.description), str(seq.id)))
    num+=1
    #sample=sys.argv[1].split(".",-1)
    #print sys.argv[1],sample,seq.description



#C:\Python27\python.exe D:/python_natebook/idsse_py/fasta/fasta.rename.py 16S-A_HM2HNBCX2_L1.fp.R1.fasta fasta

