library(keras)
library(tidyverse)
library(tidymodels)
library(tensorflow)
library(tfhub)

# Loading the pre-trained Universal Sentence Embedder
model.url <- "https://tfhub.dev/google/universal-sentence-encoder/4"
USE.layer <- tfhub::layer_hub(handle = model.url, trainable = FALSE,
                              name = "Universal Sentence Embedding Layer")
