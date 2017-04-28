
How to simulate results for 150bp paired-end reads, usings bowtie2 (with random assignment)

Step 1 (generate simulated reads): ```bsub < code/simulation_baseline/1_simulate_replicates.sh```  
Step 2 (align the simulated reads: ```bsub < code/simulation_baseline/bowtie2_replicates.sh```  
Step 3 (convert BAM file to bed file, read depth results): ```code/simulation_baseline/make_bed_replicates.sh```  
