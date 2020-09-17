
# Table of Contents



Try to think these problems through but don't be afraid to enter them
into an R interpreter if you want to. You still need to explain why
they produce the results that they do.

Q1: Consider the function:

    f <- function(x){
      if(x < 10){
         f(x+1);
      } else {
         x
      }
    }

What is the value of `f(0)`? Why?

What about `f(100)`?

Q2: Consider another function:

    g <- function(){
      x <- 0;
      function(){
        x <<- x + 1;
        x
      }
    }

And consider:

    h1 <- g();
    h2 <- g();

What is the result of?

    c(h1(), h2(), h1(), h1(), h2());

And why?

gg <- function(){
    list(list(x=0), function(faux_env){
        faux_env$x <- faux_env$x + 1;
        list(faux_env$x, faux_env);
    })
}

i <- 1;
Map(function(name) { 
 out <- list(name, i); 
 i <<- i + 1; 
 out 
 }, names)
