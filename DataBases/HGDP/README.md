You'll need to download the [HGDP](http://hagsc.org/hgdp/files.html) files, the [sample info](https://web.stanford.edu/group/rosenberglab/data/rosenberg2006ahg/SampleInformation.txt), the hg18 to hg19 [chain file](hgdownload.cse.ucsc.edu/goldenPath/hg18/liftOver/hg18ToHg19.over.chain.gz), and the latest hg 19 SNP file information.
You can do that by opening the terminal in this location and running:

```bash
wget http://hagsc.org/hgdp/data/hgdp.zip
wget https://web.stanford.edu/group/rosenberglab/data/rosenberg2006ahg/SampleInformation.txt
wget hgdownload.cse.ucsc.edu/goldenPath/hg18/liftOver/hg18ToHg19.over.chain.gz
```

To download the SNP file information, type in the terminal

```bash
mysql --user=genome --host=genome-mysql.cse.ucsc.edu -A -N -D hg19 -e 'SELECT chrom, chromStart, chromEnd, name FROM snp151Common' > snp151Common.bed
sed -i -e 's/chr//g' snp151Common.bed
```

The second line is to remove the `chr` because the 1000G data doesn't use that.
The `myqsl-client` package should have been installed using the `mergeref.yml` file, so make sure you have the `mergeref` environment activated (by typing: `conda activate mergeref`)

Once done that, unzip the HGDP files (no need to unzip the chain file), running these commands:

```bash
unzip hgdp.zip
mv hgdp/* .
```
