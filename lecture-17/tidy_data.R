library(tidyverse);
source("utils.R")

data <- read_csv("source_data/datasets_38396_60978_charcters_stats.csv") %>%
    nice_names() %>%
    filter(total > 6) %>%
    filter(alignment %in% c("good","bad"));

system("mkdir -p derived_data");
write_csv(data, "derived_data/clean_stats.csv");


