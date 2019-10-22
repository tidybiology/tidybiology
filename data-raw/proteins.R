#code to download uniprot protein data
library(tidyverse)
library(here)
library(usethis)
library(janitor)

#https://www.uniprot.org/uniprot/?query=*&fil=organism%3A%22Homo+sapiens+%28Human%29+%5B9606%5D%22+AND+reviewed%3Ayes
proteins <- read_tsv(here::here("tmp", "uniprot-filtered-organism%3A%22Homo+sapiens+%28Human%29+%5B9606%5D%22+AND+review---2.tab"), col_names = TRUE) %>%
  clean_names() %>%
  rename(uniprot_id = entry) %>%
  separate(gene_names, into = c("gene_name", "gene_name_alt"), sep = " ", extra = "merge", fill = "right") %>%
  separate(protein_names, into = c("protein_name", "protein_name_alt"), sep = "\\(", extra = "merge", fill = "right") %>%
  arrange(gene_name)

#run to generate csv; commented out due to size
#write_csv(proteins, path = here::here("data-raw", "proteins.csv"))
usethis::use_data(proteins, overwrite = TRUE, compress = 'xz')
