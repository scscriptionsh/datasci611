library(tidyverse)

library(ggplot2)
library(babynames)

dog_data_raw <- read_csv("source_data/NYC_Dog_Licensing_Dataset.csv");
human_data <- babynames %>% as_tibble() %>% rename(gender=sex) %>% 
  mutate(species="human") %>% 
  filter(year>=2014) %>%
  mutate(name=tolower(name));

dog_data_raw <- dog_data_raw %>% 
  select(AnimalName, AnimalGender, AnimalBirthMonth, LicenseIssuedDate) %>%
  rename(name=AnimalName, gender=AnimalGender, year=AnimalBirthMonth) %>%
  mutate(species="dog") %>% 
  filter(year>=2014 & 
           year == 
           lubridate::year(parse_date_time(LicenseIssuedDate,"mdy"))) %>%
  select(-LicenseIssuedDate) %>%
  mutate(name=tolower(name));

dog_yearly_totals <- dog_data_raw %>% group_by(gender,year) %>% 
  tally(name="total") %>%
  arrange(year, gender);

ggplot(dog_yearly_totals,aes(year,total)) + geom_line(aes(color=gender));

dog_data <- dog_data_raw %>% group_by(year, gender, name, species) %>%
  tally() %>% left_join(dog_yearly_totals,by=c("gender","year")) %>% 
  mutate(prop=n/total) %>%
  select(-total) %>%
  select(year, gender, name, n, prop, species);

all_data <- rbind(human_data, dog_data);

emmas <- all_data %>%
  filter(name=="emma");

