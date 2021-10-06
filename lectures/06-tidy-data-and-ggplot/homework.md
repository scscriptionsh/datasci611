For this homework you will need to get a copy of the data sets we used
in class. These are available here:

```
https://github.com/Vincent-Toups/datasci611/blob/main/lectures/06-tidy-data-and-ggplot/source_data/character-data.csv
https://github.com/Vincent-Toups/datasci611/blob/main/lectures/06-tidy-data-and-ggplot/source_data/character-page-data.csv
```

You can download them by clicking the "raw" button or by checking out
a copy of my repository.

Homework should be submitted in terms of an RMarkdown File.

1. Reproduce our Data Cleansing Steps:
   a. normalize the character data in the data frame
   b. remove duplicates
   c. remove rare elements
   
2. For n = 1:20 how many elements k do we throw away when we throw away
   values with counts < n?
   
3. Make a plot of n vs k. Hint: you can construct a table by saying

```
data <- tibble(n=n, k=k);
```

4. Reproduce the plot I made for powers for professions instead.
