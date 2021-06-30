library(tidyverse);

gg_circle <- function(r, xc, yc, color="black", fill=NA, ...) {
    x <- xc + r*cos(seq(0, pi, length.out=100))
    ymax <- yc + r*sin(seq(0, pi, length.out=100))
    ymin <- yc + r*sin(seq(0, -pi, length.out=100))
    annotate("ribbon", x=x, ymin=ymin, ymax=ymax, color=color, fill=fill, ...)
}

purported_flow <- function(){
    df <- tibble(name=c("Plan Experiment",
                        "Collect Data",
                        "Clean Data",
                        "Analyse Data",
                        "Write Paper",
                        "Publish"))
    ggplot(df) +
        gg_circle(r=0.5,xc=10*(seq(nrow(df))),yc=0);
}

