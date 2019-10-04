#code to generate four omim datasets
library(tidyverse)
library(here)
library(janitor)
library(stringr)

#raw files downloaded from https://www.omim.org/downloads/ after registration
#Please note that this data access account, and url links below, will expire on Oct. 2nd, 2020.

#move to JOIN
#url1 <- "https://www.omim.org/static/omim/data/mim2gene.txt"
#omim_mim2gene <- read_tsv(url1, col_names = TRUE, skip = 4) %>%
#  clean_names() %>%
#  rename(mim_entry_type = mim_entry_type_see_faq_1_3_at_https_omim_org_help_faq)

url2 <- "https://data.omim.org/downloads/AKV6kFkKTU2--cJCkUDVEg/mimTitles.txt"
path2 <- "/Users/matthewhirschey/Dropbox/DUKE/PROJECTS/tidybiology-lectures/datasets/OMIM/mimTitles.txt"
omim_mimtitles <- read_tsv(path2, col_names = TRUE, skip = 2) %>%
  clean_names()
mimtitles$preferred_title_symbol <- str_to_title(mimtitles$preferred_title_symbol)
mimtitles$alternative_title_s_symbol_s <- str_to_title(mimtitles$alternative_title_s_symbol_s)
mimtitles$included_title_s_symbols <- str_to_title(mimtitles$included_title_s_symbols)

url3 <- "https://data.omim.org/downloads/AKV6kFkKTU2--cJCkUDVEg/genemap2.txt"
path3 <- "/Users/matthewhirschey/Dropbox/DUKE/PROJECTS/tidybiology-lectures/datasets/OMIM/genemap2.txt"
omim_genemap <- read_tsv(path3, col_names = TRUE, skip = 3) %>%
  clean_names()
omim_genemap$number_chromosome <- str_remove(omim_genemap$number_chromosome, "chr")

url4 <- "https://data.omim.org/downloads/AKV6kFkKTU2--cJCkUDVEg/morbidmap.txt"
path4 <- "/Users/matthewhirschey/Dropbox/DUKE/PROJECTS/tidybiology-lectures/datasets/OMIM/morbidmap.txt"
omim_morbidmap <- read_tsv(path4, col_names = TRUE, skip = 3) %>%
  clean_names()

#omim_morbidmap <- mutate(omim_morbidmap, phenotype_mapping = str_extract(omim_morbidmap$number_phenotype, "\\(\\d\\)$"))
#omim_morbidmap$phenotype_mapping <- str_remove_all(omim_morbidmap$phenotype_mapping, "\\(")
#omim_morbidmap$phenotype_mapping <- str_remove_all(omim_morbidmap$phenotype_mapping, "\\)")

#write_csv(omim_mim2gene, path = here::here("data-raw", "omim_mim2gene.csv"))
write_csv(omim_mimtitles, path = here::here("data-raw", "omim_mimtitles.csv"))
write_csv(omim_genemap, path = here::here("data-raw", "omim_genemap.csv"))
write_csv(omim_morbidmap, path = here::here("data-raw", "omim_morbidmap.csv"))

#usethis::use_data(omim_mim2gene, overwrite = TRUE, compress = 'xz')
usethis::use_data(omim_mimtitles, overwrite = TRUE, compress = 'xz')
usethis::use_data(omim_genemap, overwrite = TRUE, compress = 'xz')
usethis::use_data(omim_morbidmap, overwrite = TRUE, compress = 'xz')
