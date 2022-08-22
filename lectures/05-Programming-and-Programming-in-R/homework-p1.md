Homework Part 1
===============

1. What is the difference between `<<-` and `<-`?
2. If we type `1:10` into R we get `c(1,2,3,4,5,6,7,8,9,10)`. We added
   Rule 6 to account for this behavior. Did we need to?
3. Given the following code:


        test_value <- 10;
        for(x in 1:100){
            test_value <- x;
        }
        test_value


    What can you conclude about the _environment_ where the body of the
    for loop is interpreted by R?

4. Write a snippet to test whether `while` loops follow the same rule.
5. The Fibbonoci Sequence:

   1, 1, 2, 3, 5, 8, 13, 21, 34, ...
   
   Is produced by starting with the sequence 1, 1. The nth value is
   then defined as the sum of the 2 previous values.
   
   Write a function `make_fib_counter` which returns a function which
   gives successive fibonocci numbers upon repeated invocation.
   
6. The sequence (1,1) constitutes the initial condition for the
   Fibbonoci sequence. That is to say that we can't apply the rule
   "the next fibbonoci number is the sum of the previous two" without
   specifying at least two numbers to begin with. Write a second
   function that produces a function which counts up a sequence
   generated with an arbitrary initial condition.
   
   Something like this:
   
   ```
   make_nocci <- function(c1, c2){
       function(){
           <fun part here>
       }
       }
   ```

7. Explain how the code in 6 works.
