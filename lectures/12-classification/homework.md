Grab the powers data sets from:

https://github.com/Vincent-Toups/datasci611/raw/main/lectures/12-classification/source_data/prime_earth_characters.csv
https://github.com/Vincent-Toups/datasci611/raw/main/lectures/12-classification/source_data/prime_earth_powers.csv

1. Reproduce the code which replaces unusual powers with "other", and
   pivots the resulting data set to a wide form. You can copy the code
   from lecture but this should be something you can do without doing
   so now.
   
   a. Use a dimensionality reduction method of your choice to project
   the data down to six dimensions.
   
   b. use LDA or Logistic Regression to produce a clustering.
   
   c. calculate and plot an ROC curve. (Note that `arrange` I'm using
   to make the ROC curve look nice).
   
   How well does the classifier do?
   
2. Reproduce the GBM classifier from lecture. Using your test data set
   calculate the 
   
   1. true positive, false positive, true negative, false negative rates
   2. the precision, recall and f1 score.
   3. plot an ROC Curve.
   
3. Now consider traditional gender vs non-traditional gender. Treat
   "male" and "female" as "traditional" and all other genders as
   "non-traditional". Build a gbm to classify gender as traditional vs
   non-traditional using super powers.
   
   HINT: when you perform you train test split, make sure you do so in
   such a way that both the training and testing set contain examples
   of the relatively rare non-traditional genders.
   
   Calculate:
   
   1. true positive, false positive, true negative, false negative rates
   2. the precision, recall and f1 score.
   3. plot an ROC Curve.

