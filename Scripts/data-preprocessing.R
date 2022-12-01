library(tidyverse)
library(tidymodels)

# Loading in data
reddit.data <- read.csv("Data/Reddit_Data.csv")

# encode data so that each column represents 1 if it that column's label
# 1 in the neutral column indicates neutral sentiment etc
reddit.data.encoded <- reddit.data %>% 
  mutate("Negative" = ifelse(category == -1, 1, 0),
         "Neutral" = ifelse(category == 0, 1, 0),
         "Positive" = ifelse(category == 1, 1, 0)) %>%
  select(-category)

# train test split
set.seed(1111)

partition.reddit <- reddit.data.encoded %>%
  initial_split(prop = 0.8)

reddit.train.text <- training(partition.reddit) %>%
  pull(clean_comment)

reddit.train.labels.encoded <- training(partition.reddit) %>%
  select(-clean_comment)

reddit.test.text <- testing(partition.reddit) %>%
  pull(clean_comment)

reddit.test.labels.encoded <- testing(partition.reddit) %>%
  select(-clean_comment)



# loading in twitter data
twitter.data <- read.csv("Data/Twitter_Data.csv")
twitter.data <- twitter.data[complete.cases(twitter.data),]


# trying to remove all neutrals
twitter.data <- twitter.data[twitter.data$category != 0, ]

# set negative sentiment to 0 and positive to 1
twitter.data <- twitter.data %>%
  mutate(sentiment = ifelse(category == -1, 0, 1)) %>%
  select(-category)

set.seed(1111)
partition.twitter <- twitter.data %>%
  initial_split(prop = 0.8)

twitter.train.text <- training(partition.twitter) %>%
  pull(clean_text)

twitter.train.labels <- training(partition.twitter) %>%
  select(-clean_text)

twitter.test.text <- testing(partition.twitter) %>%
  pull(clean_text)

twitter.test.labels <- testing(partition.twitter) %>%
  select(-clean_text)



