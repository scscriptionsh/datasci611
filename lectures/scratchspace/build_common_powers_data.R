library(tidyverse);
library(matlab);
library(Rtsne);

nice_strings <- function(x){
    x %>% tolower() %>% str_trim() %>%
        str_replace_all("[^a-z]"," ") %>%
        str_replace_all(" +"," ") %>%
        str_trim() %>%
        str_replace_all(" ","_");
        
}
