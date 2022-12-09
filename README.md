# Transfer Learning Vignette

Vignette on transfer learning using *model name* pretrained model from *model source* for PSTAT 197A at UC Santa Barbara

### Contributors
* Bernie Graves
* Kabir Snell
* Summer Xia
* Ao Xu

### Abstract
Deep learning models can take a lot of time and resources to train, especially when there the amount of data gets large. Transfer learning lets you use pre-trained models on related but different tasks, saving time and resources while still using quality models. We used a pretrained model from Google called the Universal Sentence Encoder which essentially turns sentences into vectors. First you load the pretrained model and set the already trained layers to not be trainable. Then you make this pretrained model a layer in your deep learning model and train on your new data. Transfer learning has applications beyond sentiment analysis. It can be used with any pretrained deep learning model that you have access to. 

### Repository Contents
* Data
  * Our data set contains sentiment analysis observations twitter.
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
  * https://www.v7labs.com/blog/transfer-learning-guide#:~:text=Transfer%20learning%20models%20achieve%20optimal,training%20neural%20networks%20from%20scratch.
    * This article provides a high level explanation of transfer learning and some deep learning models.
  * https://research.aimultiple.com/transfer-learning/
