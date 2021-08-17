library(tidyverse);

data <- read_csv("derived_data/powers_tsne.csv");

ggplot(data, aes(X1,X2)) + geom_point();
