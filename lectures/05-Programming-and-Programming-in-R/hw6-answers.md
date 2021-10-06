1.

`<-` arrow either creates a new binding in the current environment if
none exists or modifies the binding in the current environment if it
does exist.

`<<-` Creates a new binding in the lexically enclosing environment if
none exists or modifies it if it does. 

2. We didn't need to because `:` is just a regular infix operator like
   `+`, `-` etc and those are covered by other rules, although those
   rules don't explicitly mention `:`.
   
3. Since `test_value` is updated by the loop we can conclude that
   although a for loop has a bracketed body like a function it doesn't
   create a new environment.
   
4. 

```
test_value <- 10;
x <- 1;
while(x <= 100){
    test_value <- x;
    x <- x + 1;
}
```

5. 

I will accept this (9/10):

```
make_fib_counter <- function(){
    state <- c(1,1);
    function (){ 
       new_value <- sum(state);
       state <<- c(state[[2]], new_value);
       new_value
    }
}

```

But this is more correct (10/10):

```{r}
make_fib_counter <- function(){
    state <- c();
    function (){
        if(length(state) == 0){
            state <<- c(1);
            1
        } else if (length(state)==1) {
            state <<- c(1,1);
            1
        } else {
            new_value <- sum(state);
            state <<- c(state[[2]], new_value);
            new_value
        }
    }
}

```

6. 

Similar to the above, I will accept (9/10) functions which return
counters which count up from the first non-trivial term of the
sequence.

```{r}
make_nocci_counter <- function(seed){
    stopifnot(length(seed)==2); # error check not necessary.
    state <- c();
    function (){
        if(length(state) == 0){
            state <<- seed[[1]];
            state[[1]];
        } else if (length(state)==1) {
            state <<- seed;
            state[[2]];
        } else {
            new_value <- sum(state);
            state <<- c(state[[2]], new_value);
            new_value
        }
    }
}
```

You should check that `make_nocci_counter(c(3,2))` produces the sequence:

```
> f()
[1] 3
> f()
[1] 2
> f()
[1] 5
> f()
[1] 7
> f()
[1] 12
> f()
[1] 19
> f()
[1] 31
> f()
[1] 50
> f()
[1] 81
> f()
[1] 131
> f()
[1] 212
> f()
[1] 343
```
