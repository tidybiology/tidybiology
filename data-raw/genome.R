#code chunk to scrape genome data
library(tidyverse)
library(rvest)
library(here)
library(janitor)

url <- read_html("https://en.wikipedia.org/wiki/Human_genome")

genome <- url %>%
  html_nodes(xpath = '//*[@id="mw-content-text"]/div/table[2]') %>% #got xpath from inspect element, copy xpath
  html_table()

genome <- genome[[1]]
genome <- as_tibble(genome, .name_repair = "minimal") %>%
  clean_names()
genome <- genome %>%
  filter(!str_detect(chromosome, "mtDNA")) %>% #remove mitochondrial dna
  filter(!str_detect(chromosome, "total")) %>%
  select(-links) %>%
  select(-cumulative_percent)

genome$basepairs <- str_remove_all(genome$basepairs, "\\,")
genome$basepairs <- as.numeric(genome$basepairs)

genome$variations <- str_remove_all(genome$variations, "\\,")
genome$variations <- as.numeric(genome$variations)

genome$centromereposition_mbp <- as.numeric(genome$centromereposition_mbp)

chromosome_levels <- c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "X", "Y")
genome$chromosome <- fct_relevel(genome$chromosome, chromosome_levels)


write_csv(genome, path = here::here("data-raw", "genome.csv"))
usethis::use_data(genome, overwrite = TRUE, compress = 'xz')
