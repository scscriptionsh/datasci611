library(tidyverse);

powers <- read_csv("derived_data/powers.csv") %>%
    filter(universe == "prime_earth");
characters <- read_csv("derived_data/characters.csv") %>%
    filter(universe == "prime_earth");

write_csv(powers, "derived_data/prime_earth_powers.csv");
write_csv(characters, "derived_data/prime_earth_characters.csv");



