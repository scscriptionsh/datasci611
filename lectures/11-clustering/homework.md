Consider the following data set:


```{r}
data <- rbind(tibble(x=rnorm(100, 3, 1),
                     y=rnorm(100, 3, 1)),
              tibble(x=rnorm(100, -3, 1),
                     y=rnorm(100, 3, 1)),
              tibble(x=rnorm(100, 0, 1),
                     y=rnorm(100, -3, 1)));

ggplot(data, aes(x,y)) + geom_point() + coord_equal()

```

1. Perform a k-means clustering with 3 clusters and plot the results
   with the clusters color coded.
   
2. Now consider clustering with n = 2, 3, 4, 5, 6 clusters. Repeat the
   clustering 5 times for each number of clusters and calculate the
   normalized mutual information between all the clusterings for each
   different number of clusters. Plot the average value of these
   mutual informations for n = 2, 3, 4, 5, 6.
   
   What is your interpretation of these results?
   
3. Now consider this data set:

```{r}
data2 <- rbind(tibble(r=rnorm(100, 3, 0.8),
                      th=rnorm(100, 3, 0.1)),
               tibble(r=rnorm(100, 0, 1.2),
                      th=rnorm(100, 3*pi/2, 0.1)),
               tibble(r=rnorm(400, 6, 0.5),
                      th=runif(400, 0, 2*pi))) %>%
    transmute(x=r*cos(th),y=r*sin(th)); 
ggplot(data2, aes(x,y)) + geom_point()

```

Do you expect k-means to work on this data set? What about
fuzzy-c-means? Why or why not?

4. Find all the pairwise euclidean distances between the points and
   construct a similarity matrix for this data set.
   
   Hint: the package "rdist" provides a function "rdist" which
   calculates a matrix of pairwise distances.
   
   Once you have this matrix, choose a threshold (by looking at the
   plot) and then invoke spectral clustering via reticulate following
   the example in the class with this matrix.
   
   You will need to specific the "precomputed" "affinity" option.
   
   Cluster with 3 clusters and make a color coded plot of your
   results.
   
   

