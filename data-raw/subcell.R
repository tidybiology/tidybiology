#code to download sub cell data
library(tidyverse)
library(here)
library(usethis)
library(janitor)

#source from here[https://compartments.jensenlab.org/Downloads]

url <- "http://download.jensenlab.org/human_compartment_integrated_full.tsv"

subcell_raw <- read_tsv(url, col_names = FALSE)

subcell_full<- subcell_raw %>%
  clean_names() %>%
  rename(ensembl_prot_id = x1, gene_name = x2, go_term = x3, location = x4, score = x5) %>%
  filter(str_detect(location, "cellular_component", negate = TRUE))

#cleaning
omit <- c("Cell|Intracellular\\spart|Intracellular|complex|organelle|Organelle|GO|Virion|Wnt|rectifying") #couple of specific terms at end, that show high scores for specific processes
subcell <- subcell_full %>%
  filter(str_detect(location, omit, negate = TRUE)) %>%
  arrange(desc(score, location)) %>%
  mutate(
    location_simple = case_when(
      str_detect(location, "^Extracellular|Host") == TRUE ~ "Extracellular",
      str_detect(location, "^Cyto|cyto|droplet|body|Photoreceptor|Proteasome|Myo") == TRUE ~ "Cytoplasm",
      str_detect(location, "^Mito") == TRUE ~ "Mitochondria",
      str_detect(location, "^Nucleolus|Chromatin|chromatin|Chromosom") == TRUE ~ "Nucleolus",
      str_detect(location, "^Nuc|Centriole") == TRUE ~ "Nucleus",
      str_detect(location, "^Golgi") == TRUE ~ "Golgi",
      str_detect(location, "^Ribo|ribosom|Polysome") == TRUE ~ "Ribosome",
      str_detect(location, "^Vesicle") == TRUE ~ "Vesicle",
      str_detect(location, "ER|^Endoplasmic") == TRUE ~ "ER",
      str_detect(location, "^Peroxisom") == TRUE ~ "Peroxisome",
      str_detect(location, "vesicle|Vesicle") == TRUE ~ "Vesicle",
      str_detect(location, "vacuole|Vacuole") == TRUE ~ "Vacuole",
      str_detect(location, "lysosome|Lysosom") == TRUE ~ "Lysosome",
      str_detect(location, "centrosome|Centrosom") == TRUE ~ "Centrosome",
      str_detect(location, "Membrane|membrane|Microvil|cili|Acrosom|Apical|junction|Adherens|Synapse|sheath|border") == TRUE ~ "Membrane",
      TRUE ~ "Other")) %>%
  arrange(desc(score), location_simple) %>%
  distinct(gene_name, .keep_all = TRUE) %>% #The function distinct() [dplyr package] can be used to keep only unique/distinct rows from a data frame. If there are duplicate rows, only the first row is preserved.
  select(-location) %>%
  rename(location = location_simple) %>%
  arrange(gene_name)

write_csv(subcell, path = here::here("data-raw", "subcell.csv"))
#write_csv(subcell_full, path = here::here("data-raw", "subcell_full.csv"))

usethis::use_data(subcell, overwrite = TRUE, compress = 'xz')
#usethis::use_data(subcell_full, overwrite = TRUE, compress = 'xz')
