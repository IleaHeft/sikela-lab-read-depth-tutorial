I made some adjustments to the code in https://github.com/dpastling/plethora to work with newer versions of samtools and bedtools: 
- To fix samtools issues, I modified line 31 of code. make_bed.sh to read as follows:
```
samtools sort -n -@ 5 -m 5G -o ${output}_sorted.bam $bam
```
- I also modified line 17 of code/1000genomes/2_batch_make_bed.sh to:
```
bam_file=$alignment_dir/${sample}.bam
```
- To fix the bedtools issue (-merge is deprecated in newest version), I updated line 43 of code/make_bed.sh so that the bedtools merge code reads as follows: 
```
bedtools merge -c 5 -o sum -i - > ${output}_coverage.bed
```
