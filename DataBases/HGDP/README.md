You'll need to download the [HGDP](http://hagsc.org/hgdp/files.html) files, the [sample info](https://web.stanford.edu/group/rosenberglab/data/rosenberg2006ahg/SampleInformation.txt), and the hg18 to hg19 [chain file](hgdownload.cse.ucsc.edu/goldenPath/hg18/liftOver/hg18ToHg19.over.chain.gz).
You can do that by opening the terminal in this location and running:
`wget http://hagsc.org/hgdp/data/hgdp.zip`
`wget https://web.stanford.edu/group/rosenberglab/data/rosenberg2006ahg/SampleInformation.txt`
`wget hgdownload.cse.ucsc.edu/goldenPath/hg18/liftOver/hg18ToHg19.over.chain.gz`

Once done that, unzip the HGDP files (no need to unzip the chain file), running these commands:
`unzip hgdp.zip`
`mv hgdp/* .`
