#!/bin/bash --login
#SBATCH --job-name=fetchngs_e2f5
#SBATCH --time=3:59:00
#SBATCH --mem=4GB
#SBATCH --cpus-per-task=1
#SBATCH --output=fetchngs_e2f5-%j.out

# Load Nextflow
module purge
module load Nextflow

# Define the samplesheet, outdir, workdir, and config
SAMPLESHEET="$SCRATCH/circdna_e2f5/ids.csv" 
OUTDIR="$SCRATCH/circdna_e2f5/fetchngs_results" 
WORKDIR="$SCRATCH/circdna_e2f5_work"
CONFIG="$SCRATCH/circdna_e2f5/icer.config"

# Run the pipeline
nextflow pull nf-core/fetchngs
nextflow run nf-core/fetchngs -r 1.12.0 -profile singularity -work-dir $WORKDIR -resume \
--input $SAMPLESHEET \
--outdir $OUTDIR \
--download_method 'sratools' \
-c $CONFIG
