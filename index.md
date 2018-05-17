# Merging HGDP and 1000G

This repo will take you through the steps to merge the HGDP and 1000G reference files into a single plink binary file.
Once the repo has been downloaded make sure that you meet all of the requirements, and download the necessary files in their respective folders.
To do that, first go to the `DataBases` folder, and read the README files indicating what needs to be downloaded on each (both the `HGDP` and the `1000G` folders).
After everything has been downloaded, you can start running the [script](https://nbviewer.jupyter.org/github/tomszar/HGDP_1000G_Merge/blob/master/Code/2018-05-MergeGenotypes.ipynb), located in the `Code` folder. 
This is a python notebook, so you can interactively run it, and modify it to your needs.
In summary the script will follow these steps:
- Transform the HGDP into plink files
- LifOver the HGDP from hg18 to hg19
- Extract only the SNPs found in the HGDP from the 1000G vcf files
- Concatenate the different chromosomes and export to plink files
- Merge the HGDP and 1000G

## Requirements

This script was ran on a Linux machine, using Ubuntu 18.04.
You will need the following programs:
- [Python 3.x](https://www.python.org/downloads/): I recommend installing python 3.x using [Anaconda](https://www.anaconda.com/download/). 

For the following programs, you can use the [bioconda](https://bioconda.github.io/) channel to install them through Anaconda.
To do that, once you've installed Anaconda follow the instructions in [here](https://bioconda.github.io/).
The script will assume that all of the following programs are in your path.
- [Plink](https://www.cog-genomics.org/plink2): to install it using [bioconda](https://bioconda.github.io/recipes/plink/README.html) use the following command `conda install plink`
- [Vcftools](https://vcftools.github.io/index.html): to install it using [bioconda](https://bioconda.github.io/recipes/vcftools/README.html) use the following command `conda install vcftools`
- [Bcftools](https://samtools.github.io/bcftools/bcftools.html): to install it using [bioconda](https://bioconda.github.io/recipes/bcftools/README.html) use the following command `conda install bcftools`
- [USCS liftOver](http://genome.ucsc.edu/cgi-bin/hgLiftOver): to install it using [bioconda](https://bioconda.github.io/recipes/ucsc-liftover/README.html) use the following command `conda install ucsc-liftover`

## Files to download

In the `DataBases` folder you'll need to download the respective files.
In each folder (`HGDP` and `1000G`) there is a README file with the same information.

### HGDP

Download the following files and paste them in the `DataBases/HGDP` folder.
The HGDP Stanford files can be downloaded from [here](http://hagsc.org/hgdp/files.html).
You will also need to download the Sample Information from [here](https://web.stanford.edu/group/rosenberglab/data/rosenberg2006ahg/SampleInformation.txt).
Finally, you'll need to download the chain file that tells liftOver how to convert between hg18 to hg19 from [here](http://hgdownload.cse.ucsc.edu/goldenPath/hg18/liftOver/hg18ToHg19.over.chain.gz).

### 1000G

Download the following files and and paste them in the `DataBases/1000G` folder.
The 1000G Phase 3 files can be downloaded from [here](ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/).

## Steps

[Here](https://nbviewer.jupyter.org/github/tomszar/HGDP_1000G_Merge/blob/master/Code/2018-05-MergeGenotypes.ipynb) you can see the steps for merging the HGDP and 1000G databases.