.. title:: Tidy Data & Plotting (dplyr and ggplot2)
:data-scale: 10
:data-max-scale: 4
:css: custom.css

.. role:: question

Organizing Your Data Science Project
====================================

Goals:

1. portability (Docker)
   It should be as easy as possible for someone to run your code.

2. traceability (Docker, Make, git)
   You should know precisely what steps when into the production of your results.

----

A Skeleton Project
==================

1. Should contain a README w/

   1. Information about Running the Code with Docker
   2. A description of what the project is

2. A Dockerfile

   A good starting point::

     FROM rocker/verse
     MAINTAINER Vincent Toups <toups@unc.edu>
    
----

The README
==========

::

    Superhero Info
    ==============

    This contains some shocking analysis of superhero data.
    
    Running the Code
    ================

        > docker build . -t project1-env
        > docker run -v `pwd`:/home/rstudio -p 8787\
                 -e PASSWORD=pwd -i project1-env

    Then go to localhost:8787 (or the ip address associated
    with your image.

----

Git and Github
==============

1. set up your public key on github
2. create a repository on github called bios611-project1
3. git init in the repo
4. git add README.md Dockerfile
5. git commit -m "Initial commit."
6. ssh-agent bash
7. ssh-add <private key>
8. copy the suggested commands from github to add the remote and push

----

Other Hints
===========

0. On vcl - every time::

     mkdir storage
     sudo  sshfs -o allow_other <onyen>@longleaf.unc.edu:/nas/longleaf/home/<onyen> storage
     cd storage

1. On vcl you can say::
   
     > export HOME=/home/<onyen>/storage

   Then you can configure git global options (name, email) once. You can also use
   your bash history::

     > history  

   Will remember commands so you can refer to them again.

2. Its handy to `grep` history like this::

     > history | grep <some-search-term>

----

If you are really having trouble
================================

Copy my repository and edit it::

    > git clone https://github.com/Vincent-Toups/bios611-project1
    > cd bios611-project1
    > git remote rm origin 
    > git remote add origin <your-created-repo>
    > git push -u origin master 

This repo has the layout and template Makefile as well as the
Dockerfile and README.

Its fine/fun to steal it.

----

Exploratory Data Science
========================

In this course we're all going on a fishing expedition.

1. We don't know what is in our data sets.
2. We don't know the quality of our data sets.

These things are more common than you might imagine: lots of times in
the private sector someone will come to you and say: "What can we do
with this data?"

A cautionary tale: 

.. figure :: images/p-hacker.png
 :width: 500px
 
 Don't be Brian Wansink. 
 https://www.buzzfeednews.com/article/stephaniemlee/brian-wansink-cornell-p-hacking

The main idea here is that you shouldn't repeatedly analyze the same data.

----

Chop and Plot
=============

The first step of any such expedition is chopping up the data and
plotting it, and thus we'll be talking about ggplot.

1. ggplot (provided by the ggplot2 library or the tidyverse) is a
   plotting library roughly based on the "grammar of graphics".
2. That means its "declarative": we provide the data and then it maps
   different dimensions of that data into "aesthetics" (x, y
   coordinate, color, size, shape) of various "geometries" (lines,
   polygons, boxes, points).
3. Like a lot of good things, you pay in abstraction for regularity
   and power.
4. ggplot2 is just about the standard way of plotting in R.
5. There are implementations or similar libraries in other languages,
   so its worth learning here.
6. As we learn ggplot we'll also learn about our dataset and what is
   wrong with it.

----

Core Ideas
==========

1. ggplots are constructed by "adding" together expressions which
   determine the plot::

     library(tidyverse);
     d <- tibble(x=runif(100),y=runif(100));
     p <- ggplot(d, aes(x,y)) + geom_point();
     ggsave("images/ggplot-ex-1.png",plot=p);

   .. image :: images/ggplot-ex-1.png
    :width: 400px

2. Learning ggplot is about learning what aesthetics are available for
   what geometries.

3. NB. ggplot is lazy - your plot won't appear unless you do something
   with the variable (like printing it).

----

Scatter Plots as a Case Study
=============================

1. Scatter plots can be constructed with the "point" geom.
2. We often wish to squeeze more data into a scatter plot. 
3. ggplot allows us to map other aesthetics besides x and y onto our
   points.
4. ?geom_point is instrumental here.
5. The web based documentation is also good: https://ggplot2.tidyverse.org/reference/

Consider::

    library(tidyverse);
    d <- read_csv("source_data/heroes_information.csv");
    p <- ggplot(d, aes(Height, Weight)) + geom_point();
    ggsave("images/superhero-height-weight.png",plot=p);

.. image :: images/superhero-height-weight.png
 :width: 400 px

What if we wanted to color code this by gender?

----

The color aesthetic
===================

Consider::

    library(tidyverse);
    d <- read_csv("source_data/heroes_information.csv");
    p <- ggplot(d, aes(Height, Weight)) + geom_point(aes(color=Gender));
    ggsave("images/superhero-height-weight-gender.png",plot=p);

.. image :: images/superhero-height-weight-gender.png
 :width: 400 px

1. All sorts of weird scope and state stuff going on here.
2. The aes function indicates the aesthetics inside are varying with
   the data (the column Gender).
3. Its hard to see all our data here because the points are all on top of one another.

----

Alpha: a Pro Tip
================

A bit of transparency::

    library(tidyverse);
    d <- read_csv("source_data/heroes_information.csv");
    p <- ggplot(d, aes(Height, Weight)) + geom_point(aes(color=Gender), alpha=0.4);
    ggsave("images/superhero-height-weight-gender-alpha.png",plot=p);

.. image :: images/superhero-height-weight-gender-alpha.png
 :width: 400 px

1. When we name an aesthetic outside of an `aes` call, it is
   constant. It cannot refer to columns in the data.
2. This is marginally better and suggests some other plots.
3. We could improve this plot by zooming in on the data points.

---- 

Setting the X and Y Limits
==========================

Limits::

    library(tidyverse);
    d <- read_csv("source_data/heroes_information.csv");
    p <- ggplot(d, aes(Height, Weight)) + 
          geom_point(aes(color=Gender), alpha=0.4) + 
          xlim(0,250) +
          ylim(0,250);
    ggsave("images/superhero-height-weight-gender-alpha-limited.png",plot=p);

.. image :: images/superhero-height-weight-gender-alpha-limited.png
 :width: 400 px

1. The dataset isn't very gender politics progressive.
2. "Male" and "Female" characters are not similarly distributed.
3. Characters without a "Gender" are distributed like Male characters.

----

Other Geoms (density)
=====================

Let's experiment with other geometries before looking at dplyr::

    library(tidyverse);
    d <- read_csv("source_data/heroes_information.csv");
    p <- ggplot(d, aes(Height)) + 
          geom_density(aes(color=Gender), alpha=0.4) + 
          xlim(0,250); ## we removed the ylim 
    ggsave("images/superhero-height-gender-alpha-limited.png",plot=p);

.. image :: images/superhero-height-gender-alpha-limited.png
 :width: 400 px

----

Other Geoms (histogram)
======================

Let's experiment with other geometries before looking at dplyr::

    library(tidyverse);
    d <- read_csv("source_data/heroes_information.csv");
    p <- ggplot(d, aes(Height)) + 
          geom_histogram(aes(color=Gender, fill=Gender), position="dodge") + 
          xlim(0,250); ## we removed the ylim 
    ggsave("images/superhero-height-gender-alpha-limited-hist.png",plot=p);

.. image :: images/superhero-height-gender-alpha-limited-hist.png
 :width: 400 px

----

Other Geoms (lines)
===================

Lines::

    library(tidyverse);
    # no fun data
    d <- rbind(tibble(x=seq(100),y=runif(100),name="series 1"),
               tibble(x=seq(100),y=runif(100),name="series 2"),
               tibble(x=seq(100),y=runif(100),name="series 3"));
    p <- ggplot(d, aes(x,y)) + geom_line(aes(color=name));
    ggsave("images/lines-ex.png",plot=p);
    
.. image :: images/lines-ex.png
 :width: 400 px
    
----

Cleaning and Comparing to Real Humans
=====================================

Might be interesting to compare this with real humans.

(From Kaggle)::

    d <- read_csv("source_data/datasets_26073_33239_weight-height.csv");
    p <- ggplot(d, aes(Height, Weight)) + geom_point(aes(color=Gender));
    ggsave("images/real-height-weight.png",plot=p);


.. image :: images/real-height-weight.png
 :width: 400 px

1. This is kind of weird!
2. Its hard to compare these without putting them side by side. 
3. There are some weird (negative) values in the super hero data.
4. The units aren't comparable.

----

Goals
=====

1. Filter out bad data.
2. Convert units
3. Put everything in one tidy data set.
4. put it all in one plot OR
5. juxtapose the plots

----

Enter Dplyr
===========

1. dplyr lets you do relational operations on tibbles/dataframes.
2. we've seen it already
3. based on pipelines through `%>%` which does a lot of nonstandard evaluation.

%>%
===

Means: On the output of the last expression, do the next expression.

That is::

    data %>% filter(x>10) %>% mutate(y=x+1);

Means this::

    mutate(filter(data, x>10), y=x+1);

----

The Most Common Dplyr Operations
================================

1. filter
2. mutate
3. join (left, inner, right)
4. group_by
5. summarize
6. select

Others
------

rename, sample_frac, sample_n, arrange, ...
See the dplyr cheet sheet (google it)

----

The Pipeline
============

::

    library(tidyverse); # gives us dplyr and ggplot2
    
    supers <- read_csv("source_data/heroes_information.csv") %>% 
      filter(Height > 0 & Weight > 0) %>% 
      select(Height, Weight, Gender) %>% 
      mutate(Type="super");

    normals <- 
      read_csv("source_data/datasets_26073_33239_weight-height.csv") %>%
      select(Height, Weight, Gender) %>%
      mutate(Height=Height*2.54,Type="normal");

    data <- rbind(supers, normals);

----

So-called Tidy Data
===================

One row, One Observation

In this case its easy but it is often hard to get our data into this
form.

----

Summarizing the Results w/ dplyr
================================

::

   data %>% group_by(Type) %>% tally();

   data %>% group_by(Type, Gender) %>% 
     summarize(n = length(Type), 
               mean_height=mean(Height),
               mean_weight=mean(Weight));

1. Women's weights in comic books are truly fucked up.
2. More women should write comics because this is nuts.

----

Plotting it all one one plot
============================

::

    p <- ggplot(data, aes(Height, Weight)) + 
      geom_point(aes(color=Type,shape=Gender));
    ggsave("images/everyone_one.png",plot=p);

.. images :: images/everyone_one.png
 :width: 400 px

1. This is kind of bad!
2. Adding an alpha would just make it worse.

----

Grid Extra (and labels)
=======================

Add to Dockerfile::

    RUN R -e "install.packages('gridExtra')"

And then::

    library(gridExtra);

    data <- data %>% arrange(Type, Gender);

    p_supers <- ggplot(data %>% filter(Type=="super", Gender %in% c("Male", "Female")),
                  aes(Height, Weight)) + 
                 geom_point(aes(color=Gender));

    p_normals <- ggplot(data %>% filter(Type=="normal"),
                  aes(Height, Weight)) + 
                 geom_point(aes(color=Gender));

    p <- grid.arrange(p_supers, p_normals, ncol=2);
    ggsave("images/everyone_two.png",plot=p);

.. image :: images/everyone_two.png 
 :width: 400 px

:question:`Name all the things that are wrong with this.`

----

::

    library(gridExtra);

    data <- data %>% arrange(Type, Gender);

    p_supers <- ggplot(data %>% filter(Type=="super", Gender %in% c("Male", "Female")),
                  aes(Height, Weight)) + 
                 geom_point(aes(color=Gender),alpha=0.25) + 
                 xlim(0,250) + 
                 ylim(0,250) + 
                 theme(legend.position = c(0, 1), 
                      legend.justification = c(0, 1)) +
                 labs(title="super heroes");

    p_normals <- ggplot(data %>% filter(Type=="normal"),
                  aes(Height, Weight)) + 
                 geom_point(aes(color=Gender),alpha=0.25) + 
                 xlim(0,250) + 
                 ylim(0,250) + 
                 guides(color=FALSE) + 
                 labs(title="normal people");

    p <- grid.arrange(p_supers, p_normals, ncol=2, nrow=2);
    ggsave("images/everyone_three.png",plot=p);

.. image :: images/everyone_three.png 
 :width: 400 px

----

Moral
=====

Making nice figures its hard. It takes a lot of fiddling.

It can be handy to save your figures as pdfs and edit them by hand
with Illustrator or Inkscape for a final publication. But that is
fraught with peril.

Notes On Organization
=====================

Now that we have a pipeline in place we should integrate this into our
Makefile.

Conceptually:

1. cleanup and concatenate the datasets
2. load figures

Make Targets
============

::

    derived_data/joined_height_data.csv:\
     source_data/datasets_26073_33239_weight-height.csv\
     source_data/heroes_information.csv
    	Rscript produce_and_join_height_data.R

    figures/heroes_and_normals_by_gender.png:\
     derived_data/joined_height_data.csv
    	Rscript plot_heroes_and_normals_with_gender.R

