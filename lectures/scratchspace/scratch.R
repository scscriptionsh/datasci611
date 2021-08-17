library(tidyverse);
library(matlab);
library(Rtsne);

PCbiplot <- function(PC, x="PC1", y="PC2") {
    # PC being a prcomp object
    data <- data.frame(obsnames=row.names(PC$x), PC$x)
    plot <- ggplot(data, aes_string(x=x, y=y)) + geom_text(alpha=.4, size=3, aes(label=obsnames))
    plot <- plot + geom_hline(aes(0), size=.2) + geom_vline(aes(0), size=.2)
    datapc <- data.frame(varnames=rownames(PC$rotation), PC$rotation)
    mult <- min(
        (max(data[,y]) - min(data[,y])/(max(datapc[,y])-min(datapc[,y]))),
        (max(data[,x]) - min(data[,x])/(max(datapc[,x])-min(datapc[,x])))
        )
    datapc <- transform(datapc,
            v1 = .7 * mult * (get(x)),
            v2 = .7 * mult * (get(y))
            )
    plot <- plot + coord_equal() + geom_text(data=datapc, aes(x=v1, y=v2, label=varnames), size = 5, vjust=1, color="red")
    plot <- plot + geom_segment(data=datapc, aes(x=0, y=0, xend=v1, yend=v2), arrow=arrow(length=unit(0.2,"cm")), alpha=0.75, color="red")
    plot
}

nice_strings <- function(x){
    x %>% tolower() %>% str_trim() %>%
        str_replace_all("[^a-z]"," ") %>%
        str_replace_all(" +"," ") %>%
        str_trim() %>%
        str_replace_all(" ","_");
        
}
powers <- read_csv("../X-01-web-scraping/powers.csv") %>% filter(universe=="Prime Earth") %>%
    select(power,character);
characters <- read_csv("../X-01-web-scraping/character-data.csv") %>% filter(universe=="Prime Earth");

powers <- powers %>% mutate(power = nice_strings(power));

character_names <- characters %>% select(character) %>% distinct();



power_probabilities <- powers %>% group_by(power) %>% summarise(p=length(character)/nrow(character_names)) %>% arrange(desc(p));

powers_wide <- pivot_wider(powers %>% mutate(dummy=1),
                             character,names_from = power, values_from = dummy, values_fill = 0);
character_names <- powers_wide %>% select(character);
powers_vectors <- powers_wide %>% select(-character);

fit <- prcomp(powers_vectors, scale=T, center=T)
PCbiplot(fit)

transformed <- fit$x %>% as_tibble()

ggplot(transformed, aes(x=PC1, y=PC2)) + geom_point();
