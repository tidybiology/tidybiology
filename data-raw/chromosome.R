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
  clean_names()
chromosome <- chromosome %>%
  filter(!str_detect(chromosome, "mtDNA")) %>% #remove mitochondrial dna
  filter(!str_detect(chromosome, "total")) %>%
  select(-links) %>%
  select(-cumulative_percent)

chromosome$basepairs <- str_remove_all(chromosome$basepairs, "\\,")
chromosome$basepairs <- as.numeric(chromosome$basepairs)

chromosome$variations <- str_remove_all(chromosome$variations, "\\,")
chromosome$variations <- as.numeric(chromosome$variations)

chromosome$centromereposition_mbp <- as.numeric(chromosome$centromereposition_mbp)

chromosome_levels <- c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "X", "Y")
chromosome$chromosome <- fct_relevel(chromosome$chromosome, chromosome_levels)

write_csv(chromosome, path = here::here("data-raw", "chromosome.csv"))
usethis::use_data(chromosome, overwrite = TRUE, compress = 'xz')
