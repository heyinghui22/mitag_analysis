import sys
#reload(sys)
#sys.setdefaultencoding("utf-8")

from Bio import SeqIO

import pandas as pd

#filename =".".join(sys.argv[1].split(".",-1)[:(len(sys.argv[1].split(".",-1))-1)])

sample_uv=[]
result4_uv = pd.read_csv(sys.argv[2], header=None, sep="\t")
for i in range(0, len(result4_uv)):
    line=result4_uv.iloc[i][0].split(" ",-1)
    #print result4_uv.iloc[i][0]
    if line[0]!="#":
        #print result4_uv.iloc[i][0]
        sample_uv.append(line[0])
#print sample_uv
#print len(sample_uv)
sample =".".join(sys.argv[1].split(".",-1)[:(len(sys.argv[1].split(".",-1))-1)])

wr=open("%s.hmmpick.fasta"%(sample),"w")

seqd={}
for seq in SeqIO.parse(sys.argv[1],"fasta"):
    seqd[seq.id]=seq.seq
for ss in sample_uv:
    wr.write(">%s\n%s\n" % (str(ss), str(seqd[ss])))

