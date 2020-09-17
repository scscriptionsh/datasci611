library(tidyverse);
library(deSolve);
library(plotly);
library(pracma);
source("utils.R");

save_plotly_in <- function(dir_name, file_name, p){
    withr::with_dir(dir_name, htmlwidgets::saveWidget(p, file_name));
}


deriv <- function(t, y, params=c(9.8, 1.0)){
    g <- params[[1]];
    l <- params[[2]];
    list(c(y[2],-(g/l)*sin(y[1])));        
}

r <- ode(c(0,0.25), seq(from=0.0, to=10.0, by=0.01), deriv, parms=c(9.8,1.0)) %>%
    as.data.frame () %>%
    as.tibble() %>% rename(theta=`1`,e=`2`);

sigma = 0.001;
pos <- r %>% mutate(x=cos(theta)+rnorm(nrow(r),0,sigma),
                    y=sin(theta)+rnorm(nrow(r),0,sigma),
                    z=rnorm(nrow(r),0,sigma));

pp <- plot_ly(x=pos$x, y=pos$y, z=pos$z, type="scatter3d", mode="markers");
save_plotly_in("images","pend3d.html",pp);

data <- pos %>% rename(t=time) %>% select(t,x,y,z);
write_csv(data,"source_data/pendulum.csv");

## Generate some High D Data

library(tidyverse);
random_cloud <- function(d,n,label){
    cc <- runif(d)*100
    ss <- runif(d)*25;
    tbl <- tibble(label=rep(label,n));
    for(i in seq(d)){
        tbl[[sprintf("x%d",i)]] <- rnorm(n,cc[[i]],ss[[i]]);
    }
    tbl;
}

ncs <- 5;

dataset <- do.call(rbind, Map(function(c){
    random_cloud(6,200,sprintf("c%d",c));
}, seq(ncs)));

write.csv(dataset,"source_data/six-dimensions.csv",row.names=FALSE);




