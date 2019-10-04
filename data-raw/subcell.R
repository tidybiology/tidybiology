#code to download sub cell data
library(tidyverse)
library(here)
library(usethis)
library(janitor)

#source from here[https://compartments.jensenlab.org/Downloads]

url <- "http://download.jensenlab.org/human_compartment_integrated_full.tsv"

subcell_raw <- read_tsv(url, col_names = FALSE)

subcell_clean <- subcell_raw %>%
  clean_names() %>%
  rename(ensembl_prot_id = x1, gene_name = x2, go_term = x3, location = x4, score = x5)

#decided NOT to make wide
#subcell_wide <- pivot_wider(subcell_clean, id_cols = ensembl_prot_id, names_from = location, values_from = score)
#join <- subcell_clean %>% select(ensembl_prot_id, gene_name) %>% distinct(ensembl_prot_id, .keep_all = TRUE)
#subcell_wide <- subcell_wide %>% left_join(join) %>% select(ensembl_prot_id, gene_name, "Ribosome":"Merozoite dense granule") %>% arrange(gene_name)

subcell <-subcell_clean

write_csv(subcell, path = here::here("data-raw", "subcell.csv"))
usethis::use_data(subcell, overwrite = TRUE, compress = 'xz')
