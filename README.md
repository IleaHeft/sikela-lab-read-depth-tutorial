# sikela-lab-read-depth-tutorial

This is a tutorial on how to run the read depth pipeline currently used by the Sikela Lab. The eventual goal of this tutorial is for an individual with only minimal programming knowledge to be able to succesfully analyze copy number variation with this pipeline. It also includes instrucions directed at specific individuals currently working on projects.

See https://github.com/dpastling/plethora for original code and usage license.  The details will be published in the forthcoming paper:

Astling, DP, Heft IE, Jones, KL, Sikela, JM. "High resolution measurement of DUF1220 domain copy number from whole genome sequence data" (2017) BMC Genomics. under review

## 1. Ensure necessary versions of programming tools/languages are installed
- bowtie2 version 2.2.9  
- samtools 1.3
- bedtools v2.25.0
- cutadapt v1.12
- Perl:  
  Math::Random  
  Math::Complex  
- R:  
    dplyr

## 2. Create a home directory for the project
mkdir "name of home directory"

## 3. Obtain the code and other necessary files for running the pipeline  
- Clone this repository: ```git clone https://github.com/IleaHeft/sikela-lab-read-depth-tutorial.git```

## 3. Build bowtie index files for hg38

## 4. Make necessary directories within your project directory  
```
mkdir fastq
```
```
mkdir logs
```   
```
mkdir alignments
```  
```
mkdir results
```  
## 5. Modify the file paths and sample list in the code/1000genomes/config.sh script as necessary

## 6. Adjust the #BSUB –J line in each script as necessary to run the desired jobs and the desired number of jobs at one time

## 7.  Run the code  
1.  ```bsub < code/1000genomes/1_batch_bowtie.sh```      
2.  ```bsub < code/1000genomes/2_batch_make_bed.sh```  
3.  ```bsub < code/1000genomes/4_batch_gc_correction.sh```
- If desired, clean up files (code exists to do this, but it isn't clear to me right now what the best way to run the code is, will update this)


