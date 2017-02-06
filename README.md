# sikela-lab-read-depth-tutorial

This is a tutorial on how to run the read depth pipeline currently used by the Sikela Lab

## 1. Ensure necessary versions of programming tools/languages are installed
- bowtie2 version 2.2.9  
- samtools 1.3
- bedtools v2.25.0  
Note: A version of the code that was made for earlier versions of samtools(version: 0.1.19-44428cd) and bedtools(version 2.17.0) is available at https://github.com/dpastling/plethora.  For detailed information on the changes I made from the code at https://github.com/dpastling/plethora see docs/changes-for-newer-samtools-bedtools.md

## 2. Create a home directory for the project
mkdir "name of home directory"

## 3. Obtain the code and other necessary files for running the pipeline  
- Clone this repository: ```git clone https://github.com/IleaHeft/sikela-lab-read-depth-tutorial.git```
- Download the bowtie2 index files from this dropbox folder: 

## 4. Make necessary directories within the your project directory  
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
- Michael: The sample list currently in the config.sh script reflects the current set of samples we want to analyze

## 6. Adjust the #BSUB –J line in each script as necessary to run the desired jobs and the desired number of jobs at one time
- Michael: I have some of the samples running on our cluster, but it is pretty busy right now.  If you could run samples 30-116, that would be great! 

## 7.  Run the code  
1.  ```bsub < code/1000genomes/1_batch_bowtie.sh```      
2.  ```bsub < code/1000genomes/2_batch_make_bed.sh```  
3.  ```bsub < code/1000genomes/4_batch_gc_correction.sh```
- If desired, clean up files (code exists to do this, but it isn't clear to me right now what the best way to run the code is, will update this)


