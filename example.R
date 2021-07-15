library(tidyverse)

d <- read_csv("lectures/X-01-web-scraping/powers.csv") %>% 
  filter(universe=="New Earth") %>% select(-universe, -url); 
alignment <- read_csv("lectures/X-01-web-scraping/character-data.csv") %>%
  filter(universe=="New Earth" & property_name == "Alignment") %>%
  select(-universe, -property_name) %>%
  rename(alignment=value);

alignment <- rbind(alignment %>% filter(alignment=="Good") %>% sample_n(1000),
                   alignment %>% filter(alignment=="Bad") %>% sample_n(1000),
                   alignment %>% filter(alignment=="Neutral") %>% sample_n(1000));

power_tally <- d %>% group_by(power) %>% tally() %>% arrange(desc(n));


common_powers <- d %>% filter(power %in% head(power_tally,10)[["power"]]) %>%
  left_join(alignment, by="character") %>%
  mutate(power=factor(power, power_tally[["power"]])) %>% 
  filter(alignment %in% c("Good","Bad","Neutral"));

p <- ggplot(common_powers, aes(power)) + 
  geom_histogram(stat="count",position="dodge2",aes(fill=alignment)) + 
  theme(axis.text.x = element_text(angle = 90))
print(p)

vectorwise <- pivot_wider(d %>% mutate(dummy=T),
                          character,
                          names_from = power, 
                          values_from = dummy, 
                          values_fill = F);

vectors <- vectorwise %>% select(-character) %>% as.matrix() %>% `*`(1.0)


