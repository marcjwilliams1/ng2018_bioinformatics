#!/bin/sh
#$ -cwd
#$ -V
#$ -l h_rt=150:0:0      # Request 48 hour runtime
#$ -t 1-24
#$ -m e
#$ -l h_vmem=4G

module load sbcs

chrom="$(sed -n "${SGE_TASK_ID}p" chrom.txt)"
refgenome=/path/to/fasta
normalbam=/path/to/normalbamfile.bam
tumourbam=/path/to/tumourbamfile.bam
gcfile=/path/to/gcfile
outputseqz=/path/to/seqzfile.${SGE_TASK_ID}.vcf

python2.7 sequenza-utils.py bam2seqz \
--fasta $refgenome \
-n $normalbam \
-t $tumourbam \
-gc $gcfile \
--chromosome $chrom | gzip > $outputseqz
