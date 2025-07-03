## Setting up `data_repo` for AmpliconArchitect (mm10)

AmpliconArchitect requires a structured reference data repository to function. This repository follows the naming convention `AA_data_repo`, but here we refer to it as `data_repo`.

To set up the data repo, follow the [official instructions on the AmpliconArchitect GitHub](https://github.com/AmpliconSuite/AmpliconArchitect#setting-up-the-AA-data-repo).

To reproduce this analysis using the mouse mm10 genome, run the following:

```bash
mkdir -p data_repo
echo export AA_DATA_REPO=$PWD/data_repo >> ~/.bashrc
cd $AA_DATA_REPO && touch coverage.stats && chmod a+r coverage.stats
source ~/.bashrc
wget https://datasets.genepattern.org/data/module_support_files/AmpliconArchitect/mm10.tar.gz
tar -xzf mm10.tar.gz
```

### Final Directory Structure Example

```bash
circdna_e2f5/data_repo
├── coverage.stats
├── mm10
│   ├── annotations
│   │   ├── gencode.vM10.basic.annotation_genes.gff
│   │   └── mm10GenomicSuperDup.tab
│   ├── cancer
│   │   ├── oncogene_list.txt
│   │   └── oncogenes
│   │       ├── AC_oncogene_set_mm10.gff
│   │       └── mm10_consensus_oncogenes_list_from_hg19.gff
│   ├── dummy_ploidy.vcf
│   ├── file_list.txt
│   ├── file_sources.txt
│   ├── last_updated.txt
│   ├── mm10-blacklist.v2.bed
│   ├── mm10_centromere.bed
│   ├── mm10_cnvkit_filtered_ref.cnn
│   ├── mm10_conserved_gain5.bed
│   ├── mm10_conserved_gain5_onco_subtract.bed
│   ├── mm10.fa
│   ├── mm10.fa.fai
│   ├── mm10.Hardison.Excludable.full.bed
│   ├── mm10_k35.mappability.bedgraph
│   ├── mm10_merged_centromeres_conserved_sorted.bed
│   ├── mm10_noAlt.fa.fai
│   └── onco_bed.bed
├── mm10.tar.gz
```

Make sure `data_repo` is accessible by the pipeline or container environment and define its path when running AmpliconArchitect manually, or ensure the environment is configured to detect it.
