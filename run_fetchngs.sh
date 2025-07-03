#!/bin/bash --login
#SBATCH --job-name=fetchngs_e2f5
#SBATCH --time=3:59:00
#SBATCH --mem=4GB
#SBATCH --cpus-per-task=1
#SBATCH --output=fetchngs_e2f5-%j.out

# Load Nextflow
module purge
module load Nextflow

# Set base directory (default to current dir if not provided)
BASE_DIR=${1:-$PWD}

# Define the samplesheet, outdir, workdir, and config
SAMPLESHEET="$BASE_DIR/ids.csv"
OUTDIR="$BASE_DIR/fetchngs_results"
WORKDIR="$BASE_DIR/work"
CONFIG="$BASE_DIR/icer.config"

# Run the pipeline
nextflow pull nf-core/fetchngs
nextflow run nf-core/fetchngs -r 1.12.0 -profile singularity -work-dir $WORKDIR -resume \
  --input $SAMPLESHEET \
  --outdir $OUTDIR \
  --download_method 'sratools' \
  -c $CONFIG
