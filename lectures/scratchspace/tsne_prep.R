library(tidyverse);
library(Rtsne);

powers <- read_csv("derived_data/prime_earth_powers.csv");
tmp <- powers %>%
    select(power, character) %>%
    mutate(dummy=1) %>% distinct();

## For some reason there are duplicate brainiac entries but it seems
## harmless to remove them with distinct here.


wide <- pivot_wider(tmp,
                           character,
                           names_from = power,
                           values_from = dummy,
                    values_fill = 0);

## to use RTsne we need to have no duplicates.

## We could simply collapse the duplicates but then we'd lose
## information about how often different powers occur so lets just add
## a little noise to our vectors.

wide_vectors <- wide %>% select(-character) %>% as.matrix();
noise <- 0.1*runif(prod(dim(wide_vectors)));
dim(noise) <- dim(wide_vectors);
jittered_vectors <- wide_vectors + noise;

tbl <- jittered_vectors %>% as_tibble();
names(tbl) <- names(wide %>% select(-character));
tbl$character <- wide$character;

write_csv(tbl, "derived_data/powers_for_tsne.csv");
