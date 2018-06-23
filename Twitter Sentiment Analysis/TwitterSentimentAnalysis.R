library(twitteR)
library(plyr)
library(dplyr)
library(tidytext)
library(ggplot2)

## TWITTER OAUTH
consumer_key <- "yourKeyHere"
consumer_secret <- "yourSecretHere"
access_token <- "yourTokenHere"
access_secret <- "yourSecretHere"

## PATH TO FILE
file_path <- "~/PathToFile/FileName.csv"

## TWITTER SEARCH REQUIREMENTS
search_terms <- '#WomensMarch2018 + #womensmarch'
search_start_date <- '2018-01-19'


## GET TWEETS
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

twitter_feed <- data.frame() ## Run line once then comment out

for (i in 1:150) {
  tweets <- twitteR::searchTwitter(search_terms, since = search_start_date, lang = "en")
  df = twitteR::twListToDF(tweets)
  twitter_feed = rbind(twitter_feed, df)
}

write.csv(twitter_feed, file_path)


## CLEAN TWEETS
stored_tweets <- read.csv(file_path)
text_only <- stored_tweets$text

clean_tweets <- list()
for (i in 1:length(text_only)) {
  clean_text <- gsub('[[:punct:]]', '', text_only[i])
  clean_text <- gsub('[[:cntrl:]]', '', clean_text)
  clean_text <- gsub('\\d+', '', clean_text)
    #to remove emojis
  clean_text <- iconv(clean_text, 'UTF-8', 'ASCII')
  clean_text <- tolower(clean_text)
    # split into words. str_split is in the stringr package
  word.list <- strsplit(clean_text, '\\s+')
    # sometimes a list() is one level of hierarchy too much
  words <- unlist(word.list)
  
  clean_tweets[[i]] <- words
}

clean_tweets <- do.call(rbind, lapply(clean_tweets, data.frame, stringsAsFactors=FALSE))
colnames(clean_tweets) <- c("word")
clean_tweets$freq <- 1


## SENTIMENT ANALYSIS
nrc <- get_sentiments("nrc")

sentiment <- inner_join(clean_tweets, nrc)
sentiment <- sentiment[, 2:3]
sentiment <- sentiment %>%
              group_by(as.factor(sentiment)) %>%
              summarise(freq = sum(freq)) %>%
              arrange(desc(freq))

ggplot(sentiment, aes(x = `as.factor(sentiment)`, y = freq)) +
  geom_point() +
  coord_flip()
