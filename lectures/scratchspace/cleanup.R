library(tidyverse);

source("util.R");

powers <- read_csv("source_data/powers.csv");
characters <- read_csv("source_data/character-data.csv");

initial_powers_rows <- nrow(powers);
initial_characters_rows <- nrow(characters);

powers <- powers %>% distinct();
characters <- characters %>% distinct();

unique_powers_rows <- nrow(powers);
unique_characters_rows <- nrow(characters);


powers <- powers %>% mutate(
                         power = nice_strings(power),
                         character = nice_strings(character),
                         universe = nice_strings(universe)
                     ) %>% distinct();

characters <- characters %>% mutate(character=nice_strings(character),
                                    universe=nice_strings(universe),
                                    property_name=nice_strings(property_name),
                                    value=nice_strings(value)) %>%
    distinct();

if(!dir.exists("derived_data")){
    mkdir("derived_data");
}

write_csv(powers,"derived_data/powers.csv");
write_csv(characters,"derived_data/characters.csv");

