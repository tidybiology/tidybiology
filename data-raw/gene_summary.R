#code to scrape and integrate

##Load libraries & clear environment
library(tidyverse)
library(rvest)
library(janitor)
library(feather)
library(here)
library(vroom)

#downlaod entrez gene ids from hugo
#from https://www.genenames.org/cgi-bin/download/custom?col=gd_hgnc_id&col=gd_app_sym&col=gd_app_name&col=gd_prev_sym&col=gd_aliases&col=gd_pub_chrom_map&col=gd_pub_refseq_ids&col=md_eg_id&col=gd_locus_type&col=md_mim_id&col=md_prot_id&status=Approved&hgnc_dbtag=on&order_by=gd_app_sym_sort&format=text&submit=submit
hugo <- vroom(here::here("data", "hugo.txt"), delim = "\t", col_names = TRUE) %>%
  clean_names()


#scrape data from: https://www.ncbi.nlm.nih.gov/gene/
entrez <- tibble(
  i = numeric(),
  entrez_symbol = character(),
  entrez_category = character(),
  entrez_summary = character()
)

ids <- hugo %>%
  drop_na(ncbi_gene_id_supplied_by_ncbi) %>%
  sample_n(10) %>%
  pull(ncbi_gene_id_supplied_by_ncbi)

for (i in ids) {
  message("Getting entry ", i)
  Sys.sleep(5) #add sleepy time according to https://www.ncbi.nlm.nih.gov/robots.txt
  url <- read_html(paste0("https://www.ncbi.nlm.nih.gov/gene/", i))

  entrez_symbol <- url %>%
    html_nodes("dd.noline") %>% #got from inspect element
    html_text() %>%
    str_remove("provided\\sby\\sHGNC")

  entrez_category <- url %>%
    html_nodes("dt:nth-child(19)") %>% #got from inspect element
    html_text()

  entrez_summary <- url %>%
    html_nodes("dd:nth-child(20)") %>% #got from inspect element
    html_text()

  tmp <- tibble(i, entrez_symbol, entrez_category, entrez_summary)

  entrez <- entrez %>%
    bind_rows(tmp)
}
#The rvest code scrapes by position in the <div>, but depenidng on which information is available, the summary position might provide other information. So I get all the summary, as well as the junk, and then filter out the junk with the last line of code

#intermediate csv file saved after 4days of scraping
#reimport
#entrez <- vroom(here::here("data", "entrez.csv"), delim = ",", col_names = TRUE)

entrez <- entrez%>%
  rename(ncbi_gene_id_supplied_by_ncbi = i) %>%
  filter(entrez_category == "Summary") %>%
  select(-entrez_category, -entrez_symbol)

#join and clean
gene_summary <- hugo %>%
  left_join(entrez) %>%
  rename(ncbi_gene_id = ncbi_gene_id_supplied_by_ncbi)

gene_summary$entrez_summary <- replace_na(gene_summary$entrez_summary, "No NCBI summary")
gene_summary$locus_type <- str_to_sentence(gene_summary$locus_type)
gene_summary$locus_type <- str_replace(gene_summary$locus_type, "Rna", "RNA")
gene_summary$approved_name <- str_to_sentence(gene_summary$approved_name)

gene_summary <- gene_summary %>%
  unite("aka", previous_symbols:synonyms, sep = ", ", na.rm = TRUE)

#master file saved
#gene_summary <- read_feather(path = here::here("data", "gene_summary.feather"))

#run to generate csv; commented out due to size
#write_csv(gene_summary, path = here::here("data-raw", "gene_summary.csv"))
usethis::use_data(gene_summary, overwrite = TRUE, compress = 'xz')
