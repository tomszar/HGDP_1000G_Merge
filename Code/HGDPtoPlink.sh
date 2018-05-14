#!/bin/bash
#Navigate to HGDP folder
cd ../Results/MergeGeno/temp/HGDP
dos2unix HGDP_FinalReport_Forward.txt
dos2unix HGDP_Map.txt
dos2unix SampleInformation.txt
head --lines=1 HGDP_FinalReport_Forward.txt > header.txt
awk '{for (i=1;i<=NF;i++) print "0",$i,"0","0"}' header.txt > hgdp_nosex.tfam
sed '1d' HGDP_FinalReport_Forward.txt > HGDP_Data_NoHeader.txt
sort -k 1b,1 HGDP_Data_NoHeader.txt > HGDP_Data_Sorted.txt
sort -k 1b,1 HGDP_Map.txt > HGDP_Map_Sorted.txt
join -j 1 HGDP_Map_Sorted.txt HGDP_Data_Sorted.txt > HGDP_compound.txt
 
awk '{if ($2=="M") $2="MT";printf("%s %s 0 %s ",$2,$1,$3);
    for (i=4;i<=NF;i++)
        printf("%s %s ",substr($i,1,1),substr($i,2,1));
    printf("\n")}' HGDP_compound.txt > hgdp.tped
 
# Add sex info
sed '1d' SampleInformation.txt > temp.txt
sed '$d' temp.txt > SampleInfo_noheader.txt
awk '{printf("HGDP%05d ",$1);
    if ($6=="m") print "1";
    else if ($6=="f") print "2";
    else print "0";}' SampleInfo_noheader.txt > Sample_sex.txt
awk 'BEGIN {
	while ((getline < "Sample_sex.txt") > 0)
		f2array[$1] = $2}
	{if (f2array[$2])
		print $1, $2, $3, $4, f2array[$2], "0"
	else
		print $2 "not listed in file2" > "unmatched"
	}' hgdp_nosex.tfam > hgdp.tfam
 
# convert to binary
plink --tfile hgdp --out hgdp --make-bed --missing-genotype - --output-missing-genotype 0
 
# Filter to 952 (or 940) people using the SampleInformation.txt file
awk '{if ($16=="1") printf("0 HGDP%05d\n",$1);}' SampleInfo_noheader.txt > Sample_keep.txt
plink --bfile hgdp --keep Sample_keep.txt --make-bed --out hgdp940

#convert back to ped to liftover
plink --bfile hgdp940 --recode --out hgdp940

#Removing big files except originals
rm HGDP_compound.txt HGDP_Data_NoHeader.txt HGDP_Data_Sorted.txt hgdp.tfam hgdp.tped hgdp.bim hgdp.bed hgdp.fam hgdp940.bim hgdp940.bed hgdp940.fam
