---
title: Merging HGDP and 1000G
output: html_document
---
# Merging HGDP and 1000G

## Requirements

Here you can see how to merge the reference samples from HGDP and 1000G. 
[Here](Code/2018-05-MergeGenotypes.html) you can see the steps.
You'll need [python 3.x](https://www.python.org/downloads/). 
I recommend using [Anaconda](https://www.anaconda.com/download/). 
Also, you'll need [plink](https://www.cog-genomics.org/plink2), [vcftools](https://vcftools.github.io/index.html), and [bcftools](https://samtools.github.io/bcftools/bcftools.html). 
I recommend using the [bioconda](https://bioconda.github.io/) channel to install them.
The script assumes that you have all of these in your path.

### HGDP

The HGDP Stanford files can be downloaded from [here](http://hagsc.org/hgdp/files.html).
You will also need to download the Sample Information from [here](https://web.stanford.edu/group/rosenberglab/data/rosenberg2006ahg/SampleInformation.txt).
The bash script `HGDPtoPlink.sh` was modified from [here](http://www.harappadna.org/2011/02/hgdp-to-ped-conversion/).
Finally, because 1000G uses the hg19 reference, we'll need to liftover the HGDP samples. 
We'll use the [USCS liftOver](http://genome.ucsc.edu/cgi-bin/hgLiftOver), which can also be installed through [bioconda](https://bioconda.github.io/recipes/ucsc-liftover/README.html).
We'll use [liftOverPlink](https://github.com/sritchie73/liftOverPlink) as wrapper to work with plink files.
Finally, you'll need to download the chain file that tells liftOver how to convert between hg18 to hg19 from [here](http://hgdownload.cse.ucsc.edu/goldenPath/hg18/liftOver/hg18ToHg19.over.chain.gz).

### 1000G

The 1000G Phase 3 files were downloaded from [here](ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/).

## Steps

[Here](https://nbviewer.jupyter.org/github/tomszar/HGDP_1000G_Merge/blob/master/Code/2018-05-MergeGenotypes.ipynb) you can see the steps for merging the HGDP and 1000G databases.