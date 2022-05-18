library(tidyverse)
library(janitor)

happy_full <- read_csv("https://raw.githubusercontent.com/BAREJAA/website_for_john/master/datasets/world-happiness-report-2021.csv") %>%
                        clean_names() %>%
                        rename(region = regional_indicator)

happy_select <- happy_full %>%
                  select(country_name:ladder_score, logged_gdp_per_capita:ladder_score_in_dystopia) %>%
                  relocate(ladder_score_in_dystopia, .after = region)

happy <- read_csv("https://raw.githubusercontent.com/BAREJAA/website_for_john/master/datasets/happy_small.csv")

happy_join_one <- happy %>%
                    inner_join(happy_full, by = "country_name") %>%
                    select(country_name, healthy_life_expectancy)

happy_join <- happy_full %>%
                filter(!(country_name %in% happy$country_name)) %>%
                slice_sample(n = 5) %>%
                select(country_name, healthy_life_expectancy) %>%
                bind_rows(happy_join_one) %>%
                .[-10 ,]

usethis::use_data(happy_full, overwrite = TRUE, compress = 'xz')
usethis::use_data(happy_select, overwrite = TRUE, compress = 'xz')
usethis::use_data(happy, overwrite = TRUE, compress = 'xz')
usethis::use_data(happy_join_one, overwrite = TRUE, compress = 'xz')
usethis::use_data(happy_join, overwrite = TRUE, compress = 'xz')
