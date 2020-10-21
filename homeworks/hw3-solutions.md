
# Table of Contents

1.  [Notes on Grading](#org2096e98)
2.  [Answer 1](#org75a0e8d)
3.  [Answer 2](#orgea75b3d)
4.  [Answer 3](#org7e0c069)
5.  [Answer 4](#org957adda)
6.  [Answer 5](#org745091c)
7.  [Answer 6](#org55dfe4e)
8.  [Answer 7](#org0bffa82)
9.  [Answer 8](#org0dc01ca)
10. [Answer 9](#org38b1691)
11. [Answer 10](#orge1236de)


<a id="org2096e98"></a>

# Notes on Grading

1.  4 Pts for each question
2.  3 Pts if the idea is right but there is a technical error
3.  2-1 Pts at your discretion for partially correct answers with more
    problems. Emphasis on ideas rather than technical details.
4.  0 pts if things are really wrong or no attempt has been made.


<a id="org75a0e8d"></a>

# Answer 1

Shell commands accept input either via the standard input (which is
either attached directly to the terminal and used interactive or
redirected in some way) and via their command line arguments. 


<a id="orgea75b3d"></a>

# Answer 2

They can write to the standard output.

Its worth nothing that processes can write to and read from
files. This isn't the usual mode by which shell commands we've
discussed operate but its ok if they mention this possibility.


<a id="org7e0c069"></a>

# Answer 3

The Dockerfile should look like this 

    DOCKERFILE rocker/verse
    MAINTAINER Student Name <student email>
    RUN R -e "install.packages('kernlab')"

Or very similar.


<a id="org957adda"></a>

# Answer 4

    DOCKERFILE rocker/verse
    MAINTAINER Student Name <student email>
    RUN R -e "install.packages('kernlab')"
    RUN apt-update -y && apt-install -y ne

(they may have left off the apt-update step. That is ok.)


<a id="org745091c"></a>

# Answer 5

It prints "hello B<sub>VARIABLE</sub>".

The first two lines create environment variables with the indicated
values. But in the \`echo\` line we only prefix A<sub>VARIABLE</sub> with a
\`$\`. Without the dollar sign the shell treats the string B<sub>VARIABLE</sub> as
a string. On the other hand, the text \`$A<sub>VARIABLE</sub>\` is expanded by the
shell.


<a id="org55dfe4e"></a>

# Answer 6

Informally - an IP address is a location for a computer on a
network. The port number is a specific slot upon which a network
server can listen.


<a id="org0bffa82"></a>

# Answer 7

Inner joins combine two tables row by row when a condition is met. The
result contains only rows where the condition is true. No data from
either table appears in the result if the join condition isn't true.

Left and Right joins are similar. A left join will contain ALL rows
from the left table, even if there are no matching rows from the right
table. Columns from the right table with have a missing value if there
was no matching row.

Right joins follow the same semantics but with left and right reversed.


<a id="org0dc01ca"></a>

# Answer 8

    library(tidyverse);
    iris %>% 
     group_by(Species) %>% 
     summarize(mean_sepal_length=mean(Sepal.Length));

The results are:

    iris %>% group_by(Species) %>% summarize(mean_sepal_length=mean(Sepal.Length));
    `summarise()` ungrouping output (override with `.groups` argument)
    # A tibble: 3 x 2
      Species    mean_sepal_length
      <fct>                  <dbl>
    1 setosa                  5.01
    2 versicolor              5.94
    3 virginica               6.59


<a id="org38b1691"></a>

# Answer 9

    library(tidyverse);
    
    p <- ggplot(iris, aes(Petal.Width, Sepal.Length)) + 
     geom_point(aes(color=Species));
    
    ggsave("iris-scatter.png", plot = p);


<a id="orge1236de"></a>

# Answer 10

    sepel_lengths <- iris %>% 
      group_by(Species) %>% 
      summarize(avg_len=mean(Sepal.Length)) %>%
      arrange(avg_len);
    smallest <- sepel_lengths$Species[[1]];
    p <- ggplot(iris %>% 
                 filter(Species != smallest),
                aes(Petal.Width, Sepal.Length)) + 
      geom_point(aes(color=Species));
    ggsave("iris-scatter2.png",plot=p);

