#code to generate join datasets
library(tidyverse)
library(janitor)

#raw files downloaded from https://www.omim.org/downloads/ after registration

url1 <- "https://www.omim.org/static/omim/data/mim2gene.txt"
join <- read_tsv(url1, col_names = TRUE, skip = 4) %>%
  clean_names() %>%
  rename(mim_entry_type = mim_entry_type_see_faq_1_3_at_https_omim_org_help_faq)

write_csv(join, path = here::here("data-raw", "omim_mim2gene.csv"))

usethis::use_data(join, overwrite = TRUE, compress = 'xz')
