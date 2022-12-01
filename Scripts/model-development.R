library(keras)
library(tidyverse)
library(tidymodels)
library(tensorflow)
library(tfhub)

# Loading the pre-trained Universal Sentence Embedder
model.url <- "https://tfhub.dev/google/universal-sentence-encoder/4"
USE.layer <- tfhub::layer_hub(handle = model.url, trainable = FALSE,
                              name = "UniversalSentenceEmbeddingLayer")

# Load in data
load("Data/Data_Processed.RData")

# train.data <- training(partition)
# train.text <- train.data %>%
#   pull(clean_comment)
# 
# train.labels.df <- train.data %>%
#   select(-clean_comment)
train.labels <- as.matrix(twitter.train.labels.encoded)

# test.data <- testing(partition)
# test.text <- test.data %>%
#   pull(clean_comment)
# test.labels.df <- test.data %>%
#   select(-clean_comment)
test.labels <- as.matrix(twitter.test.labels.encoded)

# Building the Model
model <- keras_model_sequential() %>%
  USE.layer() %>%
  layer_reshape(target_shape = c(-1, 512)) %>%
  bidirectional(layer_lstm(units = 64, return_sequences = T, go_backwards = T)) %>%
  layer_lstm(units = 64) %>%
  layer_dense(units = 128) %>%
  layer_dropout(0.25) %>%
  layer_dense(3, activation = "softmax")


# configure for training
model %>% compile(
  loss = 'categorical_crossentropy',
  optimizer = optimizer_adam(),
  metrics = 'categorical_accuracy'
)

# train
history <- model %>%
  fit(twitter.train.text,
      train.labels,
      validation_split = 0.3,
      epochs = 25)

summary(model)

train.preds <- predict(model, train.text)
evaluate(model, test.text, test.)
 
