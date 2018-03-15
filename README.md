# Bioinformatics scripts for Williams et al 2018

These repository has scripts to call mutations using mutect2 and call copy number segmentations using sequenza. This was used for some of the data used in *Quantification of subclonal selection in cancer from bulk sequencing data Williams et al Nature Genetics 2018*. All script were run on a HPC cluster using SGE queuing system. The filenames and directory structure will need to be changed at the top of each script.

## Mutect
To call single nucleotide variants we used [Mutect](https://software.broadinstitute.org/gatk/documentation/tooldocs/current/org_broadinstitute_hellbender_tools_walkers_mutect_Mutect2.php). Scripts will call mutations by splitting the genome into 322 1Mb segments and then run these in parallel (1.mutect.sh). There is then a script to merge the VCFs (2.mergemutectvcfs.sh). For the analysis in the paper we used GATK v3.6.

## Sequenza
We used [sequenza](https://cran.r-project.org/web/packages/sequenza/index.html) to call allele specific copy number changes. The first script (1.sequenza.python.sh) creates a seqz file using the provided python script for each chromosome. The second one (2.sequenza.cat_analysis.sh) concatenates all these files together, and then runs the model (sequenza.analysisR.sh) in R using the concetanated seqz file. For the analysis in the paper we used Sequenza v2.1.2.
