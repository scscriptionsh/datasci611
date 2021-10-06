library(tidyverse);

simplify_strings <- function(s){
    s %>% 
        str_to_lower() %>%
        str_trim();
}

properties <- read_csv("source_data/character-data.csv") %>%
    mutate(across(everything(), simplify_strings));


gender_occ <- properties %>% filter(property_name == "gender" |
                                    property_name == "occupation") %>%
    mutate(value=str_replace_all(value, "·", ",")) %>%
    filter(!str_detect(value, ",")) %>% distinct();

gender <- gender_occ %>% filter(property_name=="gender") %>% rename(gender=value) %>% select(-property_name);
occ <- gender_occ %>% filter(property_name=="occupation") %>% rename(occupation=value) %>% select(-property_name);

gender %>% inner_join(occ, by=c("character","universe")) %>% group_by(gender, occupation) %>% tally()
