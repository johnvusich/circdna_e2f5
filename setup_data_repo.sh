#!/bin/bash --login

# Create and set up data_repo directory for AmpliconArchitect (mm10)
mkdir -p data_repo
echo "export AA_DATA_REPO=\$PWD/data_repo" >> ~/.bashrc

cd data_repo || exit
touch coverage.stats && chmod a+r coverage.stats

# Load AA_DATA_REPO into current session
export AA_DATA_REPO=$PWD

# Download and unpack mm10 data
wget https://datasets.genepattern.org/data/module_support_files/AmpliconArchitect/mm10.tar.gz
tar -xzf mm10.tar.gz
