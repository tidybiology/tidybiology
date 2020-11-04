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
  arrange(gene_name) %>%
  mutate(mass = round(mass/1000, 1),
         ec = str_extract(protein_names, "[:digit:]{1}\\.[:digit:]{1,2}\\.[:digit:]{1,2}\\.[:graph:]{1,2}"),
         ec = str_remove(ec, "\\)")) %>%
  separate(protein_names, into = c("protein_name", "protein_name_alt"), sep = "\\(", extra = "merge", fill = "right") %>%
  mutate(protein_name_alt = str_remove(protein_name_alt, "EC [:digit:]{1}\\.[:digit:]{1,2}\\.[:digit:]{1,2}\\.[:graph:]{1,2}"),
         protein_name_alt = str_remove(protein_name_alt, "^\\)|\\($|\\)$"),
         protein_name_alt = str_trim(protein_name_alt, side = "both"),
         function_cc = str_remove(function_cc, "FUNCTION: "))


#run to generate csv; commented out due to size
#write_csv(proteins, path = here::here("data-raw", "proteins.csv"))
#usethis::use_data(proteins, overwrite = TRUE, compress = 'xz')

#saveRDS(proteins, file = here::here("tmp", "proteins.Rds"))

#rm(proteins)
#proteins <- readRDS(file = here::here("tmp", "proteins.Rds"))

# url <- "https://zenodo.org/record/4007646/files/proteins.Rds?download=1"
# tmp <- tempfile()
# download.file(url, tmp)
# proteins <- readRDS(tmp)

