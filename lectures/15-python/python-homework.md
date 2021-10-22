1. What is the difference between global, nonlocal and normal
   variables?
   
   Answer in two parts: describe the difference types of environments
   that a variable can be bound in in Python and then describe the meaning 
   of declarations:
   
   ```
   global variable_name
   ```
   
   and
   
   ```
   nonlocal variable_name
   ```
   
   And the absence of either statement.
   
   
2. Given the implementation of our Point class 

```{python}
from random import random
from math import sqrt, sin, cos, pi
class Point:
    x = 0
    y = 0
    def __init__(self, x, y):
        self.x = x;
        self.y = y;
        
    def length(self):
        r = sqrt(self.x*self.x + self.y*self.y);
        return r;
    
    def randomize_dir(self):
        r = self.length();
        theta = random()*2*pi;
        self.x = r*cos(theta);
        self.y = r*sin(theta);
        return self;
    
    def __str__(self):
        return "<{}, {}>".format(self.x, self.y)
    
    def __repr__(self):
        return "<Point: {}, {}>".format(self.x, self.y)
    
    def __add__(self, other):
        return Point(self.x + other.x, self.y + other.y)
```

What do you expect the following code to do and why?

```{python}
Point(10,10) + 1
```

What about

```{python}
Point(10,10)*1
```

3. Python also has for loops. Write a program to determine whether the
   body of a python for loop shares the same environment as its
   context or whether it is a separate environment.
   
4. The Fibbonoci Sequence:

   1, 1, 2, 3, 5, 8, 13, 21, 34, ...
   
   Is produced by starting with the sequence 1, 1. The nth value is
   then defined as the sum of the 2 previous values.
   
   Write a function `make_fib_counter` which returns a function which
   gives successive fibonocci numbers upon repeated invocation.
   
   
