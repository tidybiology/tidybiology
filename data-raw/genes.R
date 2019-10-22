#code to download ensembl gene data
library(tidyverse)
library(here)
library(usethis)
library(janitor)

#http://useast.ensembl.org/biomart/martview/cbed64b24df87be6117d411f8b1d8c93?VIRTUALSCHEMANAME=default&ATTRIBUTES=hsapiens_gene_ensembl.default.feature_page.ensembl_gene_id|hsapiens_gene_ensembl.default.feature_page.ensembl_transcript_id|hsapiens_gene_ensembl.default.feature_page.ensembl_peptide_id|hsapiens_gene_ensembl.default.feature_page.ensembl_exon_id|hsapiens_gene_ensembl.default.feature_page.description|hsapiens_gene_ensembl.default.feature_page.chromosome_name|hsapiens_gene_ensembl.default.feature_page.start_position|hsapiens_gene_ensembl.default.feature_page.end_position|hsapiens_gene_ensembl.default.feature_page.strand|hsapiens_gene_ensembl.default.feature_page.transcript_start|hsapiens_gene_ensembl.default.feature_page.transcript_end|hsapiens_gene_ensembl.default.feature_page.transcription_start_site|hsapiens_gene_ensembl.default.feature_page.transcript_length|hsapiens_gene_ensembl.default.feature_page.external_gene_name|hsapiens_gene_ensembl.default.feature_page.transcript_mane_select|hsapiens_gene_ensembl.default.feature_page.external_gene_source|hsapiens_gene_ensembl.default.feature_page.percentage_gene_gc_content&FILTERS=&VISIBLEPANEL=attributepanel
genes <- read_tsv(here::here("tmp", "mart_export.txt"), col_names = TRUE) %>%
  clean_names() %>%
  rename(transcript_length = transcript_length_including_ut_rs_and_cds) %>%
  select(gene_name, gene_description, chromosome_scaffold_name, strand:transcript_end_bp, transcript_length, gene_percent_gc_content, gene_stable_id:transcript_stable_id) %>%
  distinct(gene_name, .keep_all = TRUE) %>% #omits dupes
  separate(gene_description, into = c("gene_description"), sep = " \\[Source", remove = TRUE) #removes source annotation

genes$chromosome_scaffold_name <- str_remove_all(genes$chromosome_scaffold_name, "CHR\\_HSCHR")

genes <- genes %>%
  arrange(chromosome_scaffold_name, transcript_start_bp)

#run to generate csv; commented out due to size
#write_csv(genes, path = here::here("data-raw", "genes.csv"))
usethis::use_data(genes, overwrite = TRUE, compress = 'xz')
