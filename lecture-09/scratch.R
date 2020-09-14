library(tidyverse);

source("utils.R");

d <- read_csv("./source_data/datasets_38396_60978_charcters_stats.csv") %>%
    tidy_up_names() %>%
    mutate(neutral=alignment == "neutral") %>%
    drop_na();

d_neutral <- d %>% filter(neutral);
d_nn <- d %>% filter(!neutral);


fd <- rbind(tibble(neutral=rep(TRUE, 500),
                   intelligence = sample(d_neutral$intelligence, 500, replace=TRUE),
                   strength = sample(d_neutral$strength, 500, replace=TRUE),
                   speed = sample(d_neutral$speed, 500, replace=TRUE),
                   durability = sample(d_neutral$durability, 500, replace=TRUE),
                   power = sample(d_neutral$power, 500, replace=TRUE),
                   combat = sample(d_neutral$combat, 500, replace=TRUE)),
            tibble(neutral=rep(FALSE, 1500),
                   intelligence = sample(d_nn$intelligence, 1500, replace=TRUE),
                   strength = sample(d_nn$strength, 1500, replace=TRUE),
                   speed = sample(d_nn$speed, 1500, replace=TRUE),
                   durability = sample(d_nn$durability, 1500, replace=TRUE),
                   power = sample(d_nn$power, 1500, replace=TRUE),
                   combat = sample(d_nn$combat, 1500, replace=TRUE)));

write.csv(fd, "source_data/faux-powers.csv");



