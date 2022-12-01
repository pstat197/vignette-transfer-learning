# Transfer Learning Vignette

Vignette on transfer learning using *model name* pretrained model from *model source* for PSTAT 197A at UC Santa Barbara

### Contributors
* Bernie Graves
* Kabir Snell
* Summer Xia
* Ao Xu

### Abstract
Some models can take a lot of time and resources to train, especially when there the amount of data gets large. Transfer learning lets you use pre-trained models on related but different tasks, saving time and resources while still using quality models. We used a pretrained model from rns senGoogle called the Universal Sentence Encoder. This essentially turns sentences into vectors. We loaded the model and made it not trainable. Then we add a few more layers to the model with the required output for our dataset.

### Repository Contents
* Data
  * Our data set contains sentiment analysis observations from both twitter and reddit.
* Scripts
  * The scripts folder contains much of the technical portion of this vignette including data processing, model application etc.
* Writeup
  * Our final writeup and process will be placed in the Writeup folder. This is where the final vignette will be stored as well as any additional material that is essential to understanding the explanation of the transfer learning process.
  

### References
* Data set:
  * Charan Gowda, Anirudh, Akshay Pai, &amp; Chaithanya kumar A. (2019). <i>Twitter and Reddit Sentimental analysis Dataset</i> [Data set]. Kaggle. https://doi.org/10.34740/KAGGLE/DS/429085
* Model:
  * https://tfhub.dev/google/collections/universal-sentence-encoder/1
* Informative:
  * https://medium.com/@sourenh94/tweets-sentiment-analysis-using-deep-transfer-learning-6cab7009986f
    * This article explains the process of using transfer learning models and applying them for sentiment analysis on twitter posts.
  * https://machinelearningmastery.com/transfer-learning-for-deep-learning/
    * This article provides a high level explanation of transfer learning and some deep learning models.
