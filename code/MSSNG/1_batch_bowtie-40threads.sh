#!/usr/bin/env bash
#BSUB -J align[4-6]
#BSUB -e logs/bowtie2_%J.log
#BSUB -o logs/bowtie2_%J.out
#BSUB -R "select[mem>5] rusage[mem=5] span[hosts=1]"
#BSUB -q normal
#BSUB -n 40
#BSUB -P Sikela

# catch unset variables, non-zero exits in pipes and calls, enable x-trace.
set -o nounset -o pipefail -o errexit -x

source code/MSSNG/config.sh

# LSB_JOBINDEX is the job array position
sample=${SAMPLES[$(($LSB_JOBINDEX - 1))]}

first_pair=$fastq_dir/$sample-read1.fq
second_pair=$fastq_dir/$sample-read2.fq

echo "Aligning:" $sample
echo "Read 1 file is:" $first_pair
echo "Read 2 file is:" $second_pair

code/bowtie2-40threads.sh -i 800 -g $genome -b $alignment_dir/${sample}.bam $first_pair $second_pair


