#!/usr/bin/python3
import sys

if (len(sys.argv)!=2):
    print('usage: {:s} <filename>'.format(sys.argv[0]));
    sys.exit(0)

fbin=open(sys.argv[1].replace('.hack','.bin'),'w+b')
fhack=open(sys.argv[1],'r')
lines=fhack.readlines()
for line in lines:
	binary=int(line.strip(),2)
	byte=bytearray([(binary>>8),binary&0xff])
	fbin.write(byte)
