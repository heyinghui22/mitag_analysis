#!/mnt/data/software/miniconda3/envs/1/bin/python
#coding=utf-8
from __future__ import division
#import pandas as pd
import linecache
#import os
import sys
#reload(sys)
#sys.setdefaultencoding("utf-8")
#import re
#from Bio import SeqIO


filename =".".join(sys.argv[1].split(".",-1)[:(len(sys.argv[1].split(".",-1))-1)])
wr=open("%s.onlyAT.fq"%(str(filename)),"w")
wr2=open("%s.delAT.fq"%(str(filename)),"w")
# count = len(open(sys.argv[1],'rU').readlines())
# print count
count=57959297
m=0
n=0
for num in range (0,int(count/4)+1):
    the_line = linecache.getline(sys.argv[1], 1 + 4 * num)
    the_line2 = linecache.getline(sys.argv[1], 2 + 4 * num)
    the_line3 = linecache.getline(sys.argv[1], 3 + 4 * num)
    the_line4 = linecache.getline(sys.argv[1], 4 + 4 * num)
    if len(the_line2)>0:
        # print the_line2.count("T"),the_line2.count("A"),the_line2.count("T")+the_line2.count("A")
        # print len(the_line2),type(len(the_line2))
        #print float((the_line2.count("T") + the_line2.count("A")) )/ len(the_line2)
        if float((the_line2.count("T") + the_line2.count("A")) )/ len(the_line2) > 0.7:
            wr.write("%s%s%s%s" % (the_line, the_line2, the_line3, the_line4))
            m += 1
        if float((the_line2.count("T") + the_line2.count("A"))) /len(the_line2) < 0.7 or float((
                the_line2.count("T") + the_line2.count("A")) ) / len(the_line2)== 0.7:
            wr2.write("%s%s%s%s" % (the_line, the_line2, the_line3, the_line4))
            n += 1

print m,n



# C:\Python27\python D:\python_natebook\idsse_py\fastq\delAT.py MIS3-3_non_rRNA_1.ck.fq
#4557847 9931977
# C:\Python27\python D:\python_natebook\idsse_py\fastq\delAT.py MIS3-3_non_rRNA_2.ck.fq
#950884 13538940

# C:\Python27\python D:\python_natebook\idsse_py\fastq\delAT.py WRNA02_non_rRNA_1.fq
