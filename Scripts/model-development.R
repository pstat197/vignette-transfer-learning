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

# had to put labels in matrix
train.labels <- as.matrix(twitter.train.labels)
test.labels <- as.matrix(twitter.test.labels)

# Building the Model
model <- keras_model_sequential() %>%
  USE.layer() %>%
  layer_reshape(target_shape = c(-1, 512)) %>%
  bidirectional(layer_lstm(units = 64, return_sequences = T, go_backwards = T)) %>%
  layer_dropout(0.5) %>%
  layer_global_max_pooling_1d() %>%
  layer_dense(units = 128, activation = "relu") %>%
  layer_batch_normalization() %>%
  layer_dropout(0.25) %>%
  layer_dense(1, activation = "sigmoid")


# configure for training
model %>% compile(
  loss = 'binary_crossentropy',
  optimizer = optimizer_adam(),
  metrics = 'accuracy'
)

# train
history <- model %>%
  fit(twitter.train.text,
      train.labels,
      validation_split = 0.3,
      epochs = 5)

summary(model)

evaluate(model, twitter.test.text, test.labels)
 
