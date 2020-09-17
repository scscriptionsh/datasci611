.. title:: Programming Languages via R
:data-scale: 10
:data-max-scale: 4
:css: custom.css

.. role:: question
          
Programming Languages via R
===========================

.. container:: twocol

   .. container:: leftside
      
      Or: Talking to very Dumb Robots

      1. Ramon Llull
      2. 13th Century Polymath.
      3. Built the first "thinking" machines.
      4. Influenced Leibniz who fantasized about a totally formal system of philosophical investigation.
      5. All this stuff basically exploded when the Incompleteness Theorem blew up Hilbert's Program to formally axiomatize Mathematics (1930,1931).
      6. This put to rest or atomized a philosophical process going back at least to Aristotle, who invented variables, believe it or not.

   .. container:: rightside
      
      .. image :: images/ramon.jpg
       :width: 300 px

----

A Llull Machine
===============
(schematically)

.. image :: images/ramon-machine.png
 :width: 400 px
 :align: center

----

What does this have to do with programming languages?
=====================================================

.. container:: twocol
  
  .. container:: leftside

     A program _denotes_ a sequence of steps interpreted by an
     interpter. Either a program denotes the steps you intended or it
     doesn't.

  .. container:: rightside
     
     .. image :: images/mario.png
     
     Super Mario Bros Assembly
     (A Comprehensive Super Mario Bros. Disassembly)
     https://gist.github.com/1wErt3r/4048722

----

A Mental Interpreter
====================

Compilers convert high level code to machine code.  Interpreters
execute code in as they encounter it by calling previously created
routines. We don't really need to understand the whole process but we
do need to be able to do this:

.. container:: twocol

   .. container:: leftside

      .. image :: images/raw_source.png
       :width: 300 px


   .. container:: rightside

      .. image :: images/annotated_code.png
       :width: 300 px

.. image :: images/code-legend.png
 :align: center

----

Elements of R
=============

Warning: This material is hard and somewhat boring. I promise that if
we power through, though, everything after this will make more
sense. Please don't tune out.

1. numbers
2. strings
3. booleans 
4. lists
5. data frames

Variables and Scope
-------------------

1. A variable represents a reference to a value.
2. In most situations, when R sees a variable, it looks up the value
   stored there.
3. Certain functions can modify the "environment" which maps variables
   to values.
4. R is for the most part and by default "lexically" scoped. However,
   unlike most languages the environment is user modifiable in
   relatively complex ways and sometimes lexical scope is violated.

----

Lexical Scope
=============

Literally: the value of a variable is the value implied by the nearest
"enclosing" binding expression.

Basics:

1. ``<-`` introduces new bindings: ``x <- 10``
2. ``function`` introduces new scopes::

     x <- 10;
     f <- function(){
       x <- 11;
       y <- 12;
       print(x); 
       print(y);
     }
     
     print(x); ## 10
     f(); ## 11
          ## 12
     print(y); ## Error
3. Note that the environment created by a function is usually
   temporary and doesn't exist until invoked.

----

More on Functions
=================

Consider:: 

 f <- function(){
  10
 }

1. Functions evaluate to something, called the "return value"
2. In R this is whatever value is in the "tail position" of the
   function. Above, 10.
3. There is a ``return`` function which returns a value
   immediately. Better to not use it.

----

More on ``<-``
==============

1. `<-` always creates a new binding in the current environment unless
   one exists in that environment already.
2. If one already exists, it updates that binding.
3. If you want to change the binding in the enclosing scope, use
   `<<-`. This is handy in some circumstances.

----

Functions: Arguments
====================

Functions can take arguments. These are generally speaking passed "as
if" by value, rather than reference. The true story is complicated::

  f <- function(a_list){
   a_list[[1]] <- 10;
   a_list;
  }

  some_list <- list(1,2,3);
  whats_this <- f(some_list);
  print(some_list);
  print(whats_this);
  print(a_list); ## Error (hopefully obviously)

----

First Class Function
====================

Functions are just like any other value (if we don't use ``()``) to
call them::

 f <- function(x){
   y <- 11;
   function(z){
    x + y + z;
   }
 }

 g <- f(100);

 g(3); ## 100 + 11 + 3 -> 114

Hard Question: :question:`When we call g where does R find the value of y?`

----

Other Special Forms: if
=======================

``if`` is the basic branching operation. Unlike in many languages (but
like Lisp and Scheme) ``if`` evaluates to a value (it is an expression)::

  y <- round(runif(1)*1000);
  x <- if (y < 100) {
    "smaller"
  } else {
    "larger"
  }

If an ``if`` is in a tail position in a function then the function
returns whatever value the ``if`` returns.

----

Other Special Forms: if (2)
===========================

Multiple branches::

  if(a){
    1
  } else if (b) {
    2
  } else if (c) {
    3
  } else {
    4
  }

----

Other Special Forms: for
========================

Performs loops by iterating over things::

  for (i in c(1,2,3)) {
    print(i);
  }

Will print 1, 2, 3.

----

Other Special Forms: while
==========================

Conditional looping::

  i <- 0;
  max_i <- 100;
  while (i < max_i) {
   print(i);
  }

----

:question:`Pop Quiz`
====================

What is the difference between::

  j <- runif(1)*10;
  if(j < 10){
    for(i in c(1,2,3)){
      print(i);
      print(j);
    }
  }

and::

  for(i in c(1,2,3)){
    j <- runif(1)*10;
    if(j < 10){
      print(i);
      print(j);
    }
  }

----

What to do instead of looping
=============================

Loops are bad.

:question:`Why do you think I make this outrageous statement?`

Instead use ``Map`` or ``Reduce`` or the fact that R supports many
vectorized operations.

----

Map
===

``Map``::

  Map(function(x) x + 1, c(1,2,3)) %>% unlist() ## c(2,3,4)

or ``Reduce``::

  Reduce(function(x,y) x + y, c(1,2,3)); ## 6

----

Vectorized Code (1)
===================

R is a vector language, which means that many of its basic types are
actually vectors ::

  x <- 12

``x`` is actually a numerical vector of length 1 with the value `12` in the
first slot. And ::

  y <- "hello"

Is a vector of strings of length one whose first element is "hello".

Vectors are indexed using either ``[[]]`` or ``[]`` (of which more
later). Indexes start at ``1`` and go up to the length of the vector.

eg::

  z <- c("hello", "world", "of", "vectors");
  z[[1]] ## "hello"
  z[2:4] ## c("world","of","vectors");

``[[]]` doesn't slice - it extracts a single element.
``[]`` can slice a sequence of elements out.

----

Vectorized Code (2)
===================

Many operations work in a meaningful way on vectors::

  x <- c(1,2,3);
  y <- c(3,4,5);

  x + y ## c(4,6,8);

  sin(x); ## c(0.8414710, 0.9092974, 0.1411200);

----

Matrices
========

R kinda protects us from using these a lot directly. But::

  m <- matrix(1:9, nrow=3, ncol=3);

We use ``[]`` to access elements. In this case it takes two arguments,
rows and columsn to select::

  m[c(1,2),c(3)] ;; ## [1] 7 8

Note that both row and column matrices are coerced back into vectors.

----

Homogeneity
===========

(all the same type).

Vectors and Matrices are homogenous types. That is, a vector can
contain numbers, booleans (TRUE, FALSE in R), or strings. That is:

Allowed::

  x <- c(1,2,3);
  y <- c("extremely", "good", "ice cream");

Not allowed::

  x <- c(1,"ice cream", 2, "many");

----

Data Frames (and Tibbles)
=========================

Tables, Data Frames and Tibbles

.. figure :: images/tibbles.jpg

   Tibbles, the cat who destroyed an entire species.

To deal w/ inhomogenous tabular data we typically use tables. R has a
built in abstraction called a Data Frame but it is not
modern. Typically, we use a tibble.

There is also a list type which is sequential and can hold elements of
any type. It is less commonly used.

----

Reading Data from A File
========================

::
  
  library(tidyverse);
  data <- read_csv("data/super_hero_powers.csv");

  names(data);

----

Indexing, Names and the Dollar Operator
=======================================

Arrays, matrices and data frames can have named elements::

  a_point <- c(x=3.5, y=6.4);
  a_point["x"] # 3.5
  
Or a combination of both::

  something <- c(1,2,some_element=3);
  something["some_element"]

----

A Confusion of Indexing Options
===============================

R defines (at least) 3 ways to index into objects. (Indexing means
selecting out elements either for assignment or to get values).

1. `[]` is the slice indexer - you can pass in an array and get back
   an array of elements.
2. `[[]]` is the "extract one" indexer - it pulls out a single element
   from an object (list or vector) and thus may not return the same
   type as the `[]` must.
3. `$` if the object is a list or a data frame and the element has a
   name this can extract just that element, like `[[]]`.

----

Intuitions
==========

1. `[]` extract a subset
2. `[[]]` extract a single element, damn it
3. `$` get a column from a data frame

----

Laziness, Thunks and Irregular Evaluation
=========================================

.. container:: twocol

   .. container:: leftside
      
      This one weird R trick drives programmers crazy.  We're probably
      going to hurt your brain a little bit but no more than
      necessary, since the tidyverse is eventually going to hurt you
      anyway.

   .. container:: rightside

      .. figure :: images/lazy.jpg

        Illustration by Chloe Cushman/National Post

----

Consider this::

  f <- function(x) F

(NB - F is "FALSE" and T is "TRUE" - so called boolean values)

This function ignores its argument. Unlike in many programming
languages, anything we pass to f remains unevaluated. 

Evaluation is triggered by some operation performed inside the body of
the function.

Eg::

  g <- function(x) paste(x," is the output", collapse = "");

----

Substitute
==========

The function substitute allows us to capture the expression passed
into a function without evaluating it.

Eg::

  g <- function(x) substitute(x);
  g(print("Hello"))
  
Once we have the expression we can evaluate it ourselves using eval::

  eval(g(print("Hello"))) ; # prints "Hello"

----

eval and eval.parent
====================

(NB. ``.`` is a valid part of a variable name in R. In most other
languages it means something similar to ``$`` in R)

We can use ``eval`` along with ``new.env`` to do all sorts of silly
stuff with evaluation.

Mostly I do not suggest this - if you forget about it entirely, R
works like almost any other programming language with lexical scope.

However, the tidyverse uses non-standard evaluation extensively,
though usually in pretty straightforward ways. So its useful to know
about it.

---- 

A harder example
================

Consider::

  f <- function(a) eval.parent(substitute(a));
  g <- function(h) {
    x <- 10;
    f(x);
  }
  x <- 11;
  f(x);
  g(f);

