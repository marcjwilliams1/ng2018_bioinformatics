#!/bin/sh
#$ -cwd
#$ -V
#$ -l h_rt=100:0:0
#$ -t 1-322
#$ -m e
#$ -l h_vmem=4G

chrom="$(sed -n "${SGE_TASK_ID}p" chromsplitformat.bed)"
refgenome=/path/to/fasta
dbsnpfile=/path/to/dbsnp vcf file
normalbam=/path/to/normalbamfile.bam
tumourbam=/path/to/tumourbamfile.bam
outputvcf=/path/to/outputvcf.${SGE_TASK_ID}.vcf

java -Xmx2g -jar $GATK \
--analysis_type MuTect2 \
--reference_sequence $refgenome \
--dbsnp $dbsnpfile \
--intervals ${chrom} \
--input_file:normal $normalbam  \
--input_file:tumor $tumourbam \
--out $outputvcf
