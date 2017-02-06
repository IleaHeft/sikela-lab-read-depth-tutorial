# sikela-lab-read-depth-tutorial

This is a tutorial to teach others how to run the read depth pipeline currently used by the Sikela Lab

## 1. Obtain the code for running the pipeline  
- Clone the code from https://github.com/dpastling/plethora.git  

## 2. Make necessary directories within the “plethora” directory  
```
mkdir logs
```   
```
mkdir alignments
```  
```
mkdir results
```  
## 3. Modify the file paths and sample list in the code/1000genomes/config.sh script as necessary

## 4. Adjust the #BSUB –J line in each script as necessary to run the desired jobs and the desired number of jobs at one time

## 4. Download the bowtie2 index from the this reponsitory

## 5. Make some adjustments to the code if necessary, depending on your versions of samtools and bedtools.
- The code was originally build with samtools version 0.1.19-44428cd and bedtools version 2.17.0, newer versions of these tools will create some errors.  If this applies to you, make the following changes.

- For the current version of samtools (e.g 1.3), modify line 31 of code. make_bed.sh to read as follows:
```
samtools sort -n -@ 5 -m 5G -o ${output}_sorted.bam $bam
```
- Also, modify line 17 of code/1000genomes/2_batch_make_bed.sh to:
```
bam_file=$alignment_dir/${sample}.bam
```
- For version of bedtools in which the –merge option is deprecated (e.g. bedtools v2.25.0), update line 43 of code/make_bed.sh so that the bedtools merge code reads as follows: 
```
bedtools merge -c 5 -o sum -i - > ${output}_coverage.bed
```
## 6.  Run the code  
1.  bsub < code/1000genomes/1_batch_bowtie.sh  
2.  bsub < code/1000genomes/2_batch_make_bed.sh  
3.  Run the GC correction code (Code to run the GC correction currently has a bug in it, whill update this when it is fixed, can run steps 1 and 2 in the meantime without any problem).  
- If desired, clean up files (code exists to do this, but it isn't clear to me right now what the best way to run the code is, will update this)

