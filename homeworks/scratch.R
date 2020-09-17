g <- function(){
    x <- 0;
    list(function() {
        x <<- x + 1;
        x
    },
    function() {
        x <<- x + 1;
        x
    });
}
