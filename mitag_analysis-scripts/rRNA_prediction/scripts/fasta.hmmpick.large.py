import sys
#reload(sys)
#sys.setdefaultencoding("utf-8")

from Bio import SeqIO

import pandas as pd

#filename =".".join(sys.argv[1].split(".",-1)[:(len(sys.argv[1].split(".",-1))-1)])

sample_uv=[]
result4_uv = pd.read_table(sys.argv[2], encoding='utf-8',header=None,sep="\t",error_bad_lines=False)
#for i in range(0, len(result4_uv)):
    #line=result4_uv.iloc[i][0].split(" ",-1)
    #print result4_uv.iloc[i][0]
#    if result4_uv.iloc[i][0]!="#":
        #print result4_uv.iloc[i][0]
#        sample_uv.append(result4_uv.iloc[i][0])
#print sample_uv
#print len(sample_uv)
sample =".".join(sys.argv[1].split(".",-1)[:(len(sys.argv[1].split(".",-1))-1)])

wr=open("%s.hmmpick.fasta"%(sample),"w")

#less
#seqd={}
#for seq in SeqIO.parse(sys.argv[1],"fasta"):
#    seqd[seq.id]=seq.seq
#for ss in sample_uv:
#    wr.write(">%s\n%s\n" % (str(ss), str(seqd[ss])))

for seq in SeqIO.parse(sys.argv[1],"fasta"):
    for i in range(0, len(result4_uv)):
        if result4_uv.iloc[i][0].split(" ",-1)[0]!="#":
            id=result4_uv.iloc[i][0].split(" ",-1)[0]
            if seq.id==id:
                wr.write(">%s\n%s\n" % (str(seq.id), str(seq.seq)))
            if seq.id!=id:
                pass
#    if seq.id in sample_uv:
#        wr.write(">%s\n%s\n" % (str(seq.id), str(seq.seq)))
        break

