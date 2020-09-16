library(keras)
library(tidyverse)

data <- read_csv("source_data/six-dimensions.csv");
data$train <- runif(nrow(data)) < 0.75;

train <- data %>% filter(train);
test <- data %>% filter(!train);

train_mat <- data %>% select(x1,x2,x3,x4,x5,x6) %>% as.matrix() %>%
    scale(center=FALSE);

input_size <- 6;
latent_size <- 2;

enc_input <- layer_input(shape = input_size);
enc_input <- layer_input(shape = input_size);

intermediate <- 2560;

enc_output <- enc_input %>% 
  layer_dense(units=intermediate, activation = "relu") %>% 
  layer_activation_leaky_relu() %>% 
  layer_dense(units=latent_size) %>% 
  layer_activation_leaky_relu();

encoder <- keras_model(enc_input, enc_output);

dec_input <- layer_input(shape = latent_size)
dec_output <- dec_input %>% 
  layer_dense(units=intermediate, activation = "relu") %>% 
  layer_activation_leaky_relu() %>% 
  layer_dense(units = input_size, activation = "sigmoid") %>% 
  layer_activation_leaky_relu()

decoder <- keras_model(dec_input, dec_output)

aen_input <- layer_input(shape = input_size)
aen_output <- aen_input %>% 
  encoder() %>% 
  decoder();
   
aen <- keras_model(aen_input, aen_output);
aen %>% compile(optimizer="rmsprop", loss="mean_squared_error");
aen %>% fit(train_mat, train_mat, epochs=50000, batch_size=250);




