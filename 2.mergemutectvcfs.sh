#!/bin/sh
#$ -cwd
#$ -V
#$ -l h_rt=2:0:0
#$ -m e
#$ -l h_vmem=4G

#need bgzip, tabix and vcf-tools

concatvcf=/path/to/concatvcf.vcf
sortedvcf=/path/to/sortedvcf.vcf

for f in $(ls /path/to/vcf/files/*vcf); do
   bgzip $f
   tabix -p vcf $f.gz
done

ls /path/to/vcf/files/*vcf.gz | xargs vcf-concat > $concatvcf

vcf-sort $concatvcf > $sortedvcf
