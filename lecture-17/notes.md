
# Table of Contents

1.  [RShiny](#orgff22402)
2.  [RShiny Project Rubric](#org352e406)
3.  [Docker, RShiny, Make](#orgf484206)
4.  [Port Numbers and Shell Scripts](#orga814121)
5.  [Let's look at my Makefile first](#org03635ba)
6.  [Recall:](#org4dd12dd)
7.  [Let's look at our R code again,](#org0fd4937)
8.  [Advanced Docker Invocation Magic](#orga50bb99)
9.  [What about Windows Folks](#org5b78760)
10. [What Makes A Good Interactive Visualization?](#org5e73f99)


<a id="orgff22402"></a>

# RShiny

The next step in the construction of the class portfolio is adding an
interactive visualization of some kind to Project 1.

We'll use R-Shiny to do this. You can refresh yourselves on RShiny by
consulting [Lecture 13](https://github.com/Vincent-Toups/datasci611/tree/master/lecture-13). 

Very briefly:

1.  RShiny is a system for building interactive applications using just
    R code. We write R code and R generates all of the HTML and
    Javascript and Server Side code to generate our app. It also sets
    up a server so that we can interact with the application.
2.  In order to use Rshiny we need to be able to launch a Docker
    container.
3.  One or more RShiny applications can be intergrate into our make
    based build - our make target should just start the Shiny
    application.


<a id="org352e406"></a>

# RShiny Project Rubric

1.  20 pts: Does the Shiny project run from the Makefile and make appropriate
    use of other artifacts in the repository?
    
    That is to say: if there is data pre-processing that has to happen
    before we run the app, is it expressed as a dependency in the Makefile?
2.  20 pts: Are there instructions in the README that tell a user how to start
    the Shiny application?
3.  20 pts: Does the RShiny app allow the user to understand something that
    would be hard to understand with a static visualization? Are the
    visualizations well chosen?


<a id="orgf484206"></a>

# Docker, RShiny, Make

Here is a Shiny app that might appear in my own Project, in a file
called "power<sub>explorer.R</sub>".

    library(shiny)
    library(tidyverse)
    library(plotly)
    source("utils.R");
    
    args <- commandArgs(trailingOnly=T);
    
    port <- as.numeric(args[[1]]);
    
    data <- read_csv("source_data/datasets_38396_60978_charcters_stats.csv") %>%
        nice_names() %>%
        filter(total > 6) %>%
        filter(alignment %in% c("good","bad"));
    
    stats <- data %>% select(-name, -alignment) %>% names();
    
    
    # Define UI for app that draws a histogram ----
    ui <- fluidPage(
    
      # App title ----
      titlePanel("Superhero Powers and Alignment"),
    
      # Sidebar layout with input and output definitions ----
      sidebarLayout(
    
        # Sidebar panel for inputs ----
        sidebarPanel(
            div("How do super hero powers depend on their moral alignment?"),
    
          # Input: Slider for the number of bins ----
          sliderInput(inputId = "bins",
                      label = "Number of bins:",
                      min = 1,
                      max = 50,
                      value = 30),
    
          selectInput(inputId = "stat",
                      label="Select Stat",
                      choices=stats),
    
          selectInput(inputId = "plotType",
                      label = "Plot Type",
                      choices=c("histogram","density plot"))
    
        ),
    
        # Main panel for displaying outputs ----
        mainPanel(
    
          # Output: Histogram ----
          plotlyOutput(outputId = "distPlot")
    
        )
      )
    )
    
    server <- function(input, output) {
    
      output$distPlot <- renderPlotly({
    
          stat <- input$stat;
          bins <- input$bins;
    
          if(input$plotType=="histogram"){
              ggplotly(ggplot(data, aes_string(stat))+geom_histogram(aes(fill=alignment),
                                                                 position="dodge",
                                                                 bins=bins));
          } else {
              d <- data[[stat]];
              mn <- min(d);
              mx <- max(d);
              bw <- (mx-mn)/bins;
              ggplotly(ggplot(data, aes_string(stat))+geom_density(aes(fill=alignment),
                                                                   alpha=0.3,
                                                                   bw=bw));
    
          }
    
        })
    
    }
    
    print(sprintf("Starting shiny on port %d", port));
    shinyApp(ui = ui, server = server, options = list(port=port, host="0.0.0.0"));

To integrate such an application into our project we need to do a few things.

1.  Ensure the Dockerfile has a line like `=RUN R -e
       "install.packages('shiny')"=` (Note I'm also using Plotly)
2.  Have a make (dummy) Target that invokes the App correctly.
3.  Make sure our dependencies are expressed in the Makefile.
4.  Write a shell script or Document how we'd like to invoke the shiny app.


<a id="orga814121"></a>

# Port Numbers and Shell Scripts

The primary challenge here is that we might want to have multiple
shiny applications running at once (if we have more than one
visualization we want to develop).

We could combine them into a single shiny App with tabs but its
simpler conceptually to separate them, unless they are tightly
related.

The method I will describe will give us a chance to develop some more
experience with shell scripting and environment variables.


<a id="org03635ba"></a>

# Let's look at my Makefile first

    .PHONY: power_explorer
    
    power_explorer: derived_data/clean_stats.csv
            Rscript power_explorer.R ${PORT}
    
    derived_data/clean_stats.csv: tidy_data.R\
     ./source_data/datasets_38396_60978_charcters_stats.csv
            Rscript tidy_data.R 

Note that we've got a .PHONY target for our app. That is because
running the app doesn't really produce any artifact except for the
running application.

Further note that the power<sub>explorer</sub> target lists is dependencies in
the ordinary way and those are constructed in the ordinary way.

Finally note that we refer to an environment variable in the job. We
are "passing the variable to" R via the command args.


<a id="org4dd12dd"></a>

# Recall:

We can pass data into a bash process in two ways

1.  via the command line we use to invoke it
2.  via the standard input.

We are using method #1.


<a id="org0fd4937"></a>

# Let's look at our R code again,

specifically these lines

    library(shiny)
    library(tidyverse)
    library(plotly)
    source("utils.R");
    
    args <- commandArgs(trailingOnly=T);
    
    port <- as.numeric(args[[1]]);
    
    ### Other stuff follows ...
    ### ...

The `=commandArgs=` function allows us to see what additional
arguments were passed on the command line when someone runs Rscript.

`=trailingOnly=` means "just those arguments after the boring stuff
like Rscript and the filename."

We take the first argument to be the port and convert it to a number.

At the end of the script we say:

    
    ### ...
    ### stuff above
    
    print(sprintf("Starting shiny on port %d", port));
    shinyApp(ui = ui, server = server, options = list(port=port, host="0.0.0.0"));

We instruct Shiny to start on the appropriate port.


<a id="orga50bb99"></a>

# Advanced Docker Invocation Magic

Using Docker here presents a minor difficulty: we have to explicitly
tell Docker which ports to open up into the container when we start
it. So we want to provide some instructions (at the very least) to the
confused user. Ideally, we'd give them a shell alias of some kind.

Consider this bit of bash from my aliases.sh

    start_shiny(){
        docker run -p $2:$2 \
     -v `pwd`:/home/rstudio \
     -e PASSWORD=$SECRET_PWD \
     -it l17 sudo -H -u rstudio /bin/bash -c "cd ~/; PORT=$2 make $1"
    }

Bash supports functions (of a sort). Here we write a function which
takes a target name and a port which invokes the appropriate make
target.

We use it like this:

    source aliases.sh
    start_shiny 8788 power_explorer


<a id="org5b78760"></a>

# What about Windows Folks

(For OSX people the above should work)

For windows you might have trouble testing this and maybe you don't
want to assume a linux audience.

Your options are:

1.  Describe how to invoke the make target manually.
2.  Document how to launch the app from Rstudio.

Either option is ok for class. If you do the former you just need
something like this in your README:

    
    To run the interactive part of this project just execute the following:
    
        docker run -p 8788:8788 \
         -v `pwd`:/home/rstudio \
         -e PASSWORD=$SECRET_PWD \
         -it l17 sudo -H -u rstudio /bin/bash -c "cd ~/; PORT=8788 make power_explorer"

In the second case you need to explicity modify the instructions for
launching RStudio to expose another port and then tell them to run 

    make <that port> power_explorer

From inside the Rstudio terminal.


<a id="org5e73f99"></a>

# What Makes A Good Interactive Visualization?

1.  It exposes some qualitative aspect of the analysis: examples:
    number of principal components we select, number of clusters we choose,
    number of bins in a histogram.
2.  It plots data which has many different scales of interest.
3.  It generalizes some big combination of plots

