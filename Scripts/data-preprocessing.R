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

partition <- reddit.data.encoded %>%
  initial_split(prop = 0.8)

reddit.train.text <- training(partition) %>%
  pull(clean_comment)

reddit.train.labels.encoded <- training(partition) %>%
  select(-clean_comment)

reddit.test.text <- testing(partition) %>%
  pull(clean_comment)

reddit.test.labels.encoded <- testing(partition) %>%
  select(-clean_comment)
