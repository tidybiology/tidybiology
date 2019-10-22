#code to scrape chromosome data
library(tidyverse)
library(rvest)
library(here)
library(janitor)

url <- read_html("https://en.wikipedia.org/wiki/Human_genome")

chromosome <- url %>%
  html_nodes(xpath = '//*[@id="mw-content-text"]/div/table[2]') %>% #got xpath from inspect element, copy xpath
  html_table()

chromosome <- chromosome[[1]]
chromosome <- as_tibble(chromosome, .name_repair = "minimal") %>%
  clean_names() %>%
  rename(id = chromosome)

chromosome <- chromosome %>%
  filter(!str_detect(id, "mtDNA")) %>% #remove mitochondrial dna
  filter(!str_detect(id, "total")) %>%
  select(-links) %>%
  select(-cumulative_percent)

chromosome$basepairs <- str_remove_all(chromosome$basepairs, "\\,")
chromosome$basepairs <- as.numeric(chromosome$basepairs)

chromosome$variations <- str_remove_all(chromosome$variations, "\\,")
chromosome$variations <- as.numeric(chromosome$variations)

chromosome$centromereposition_mbp <- as.numeric(chromosome$centromereposition_mbp)

chromosome_levels <- c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "X", "Y")
chromosome$id <- fct_relevel(chromosome$id, chromosome_levels)

simplechromosome <- chromosome %>%
  select(id, basepairs)

#run to generate csv; commented out due to size
#write_csv(chromosome, path = here::here("data-raw", "chromosome.csv"))

usethis::use_data(chromosome, overwrite = TRUE, compress = 'xz')
usethis::use_data(simplechromosome, overwrite = TRUE, compress = 'xz')
