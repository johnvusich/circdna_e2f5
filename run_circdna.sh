#!/bin/bash --login
#SBATCH --job-name=circdna_e2f5
#SBATCH --time=24:00:00
#SBATCH --mem=4GB
#SBATCH --cpus-per-task=1
#SBATCH --output=circdna_e2f5-%j.out

# Load Nextflow
module purge
module load Nextflow/24.10.2

# Set the relative paths to the genome files
GENOME_DIR="$SCRATCH/circdna_e2f5/data_repo/mm10"
FASTA="$GENOME_DIR/mm10.fa"
DATA_REPO="$SCRATCH/circdna_e2f5/data_repo"

# Define the samplesheet, outdir, workdir, and config
SAMPLESHEET="$SCRATCH/circdna_e2f5/fetchngs_results/samplesheet/samplesheet.csv"
OUTDIR="$SCRATCH/vusichjo/circdna_e2f5/results"
WORKDIR="$SCRATCH/vusichjo/circdna_e2f5_work"
CONFIG="$SCRATCH/vusichjo/circdna_e2f5/icer.config"
LICENSE="$SCRATCH/vusichjo/circdna_e2f5/mosek_license_dir"

# Run the differential abundance analysis
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
