#!/bin/sh
#$ -cwd
#$ -V
#$ -l h_rt=24:0:0      # Request 48 hour runtime
#$ -m e
#$ -l h_vmem=30G

concatseqzfile=/path/to/seqzfile.vcf

cat $(find /path/to/seqfiles -name "seqzfile*" | sort -V) \
| gunzip -c - | grep -v 'chromosome' | cat header_seqz.txt - | \
python2.7 sequenza-utils.py seqz-binning -w 100 -s - \
| gzip -c > $concatseqzfile

chmod 755 sequenza.analysisR.sh

./sequenza.analysisR.sh
