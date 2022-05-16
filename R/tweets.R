library(tidyverse)
library(rtweet)
library(syuzhet)
library(lubridate)

get_token()

# tweets downloaded at
# Mon May 16 14:26:41 2022 ------------------------------

dnc <- search_tweets(
  "from:TheDemocrats", n = 100, include_rts = FALSE
)

dnc %>%
  arrange(created_at) -> dnc

gop <- search_tweets(
  "from:GOP", n = 100, include_rts = FALSE
)

gop %>%
  arrange(created_at) -> gop

# dnc v gop
tweets <- dnc %>%
  bind_rows(gop) %>%
  select(created_at, screen_name, text) %>%
  mutate(sentiment = get_sentiment(text)) %>%
  mutate(created_at = ymd_hms(created_at))

usethis::use_data(tweets, overwrite = TRUE, compress = 'xz')
