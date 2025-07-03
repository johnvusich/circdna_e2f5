#!/bin/bash --login
#SBATCH --job-name=circdna_e2f5
#SBATCH --time=24:00:00
#SBATCH --mem=4GB
#SBATCH --cpus-per-task=1
#SBATCH --output=circdna_e2f5-%j.out

# Load Nextflow
module purge
module load Nextflow

# Set base directory (default to current dir if not provided)
BASE_DIR=${1:-$PWD}

# Set the relative paths to the genome files
GENOME_DIR="$BASE_DIR/data_repo/mm10"
FASTA="$GENOME_DIR/mm10.fa"
DATA_REPO="$BASE_DIR/data_repo"

# Define the samplesheet, outdir, workdir, and config
SAMPLESHEET="$BASE_DIR/fetchngs_results/samplesheet/samplesheet.csv"
OUTDIR="$BASE_DIR/results"
WORKDIR="$BASE_DIR/work"
CONFIG="$BASE_DIR/icer.config"
LICENSE="$BASE_DIR/mosek_license_dir"

# Run the circDNA pipeline
nextflow run nf-core/circdna -r 1.1.0 -profile singularity -work-dir $WORKDIR -resume \
  --input $SAMPLESHEET \
  --outdir $OUTDIR \
  --fasta $FASTA \
  --input_format 'FASTQ' \
  --circle_identifier 'ampliconarchitect,circle_finder,circexplorer2' \
  --mosek_license_dir $LICENSE \
  --aa_data_repo $DATA_REPO \
  --reference_build 'mm10' \
  -c $CONFIG
