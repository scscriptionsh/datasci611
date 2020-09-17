
f <- function(){
    x <- 10;
    g <- function() x;
    x <- 11;
    h <- function() x;
    list(g,h);
}

ks <- f();

for(i in c(1,2,3)){
 sams_value <- runif(1);
 print(i);
}

d <- read_csv("source_data/heroes_information.csv") %>%
    filter(Height > 0 & Weight > 0) %>%
    select(Height, Weight, Gender) %>%
    mutate(Type="super");
