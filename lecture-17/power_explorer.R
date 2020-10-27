library(shiny)
library(tidyverse)
library(plotly)
source("utils.R");

args <- commandArgs(trailingOnly=T);

port <- as.numeric(args[[1]]);

data <- read_csv("derived_data/clean_stats.csv")

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
shinyApp(ui = ui, server = server, options = list(port=port,
                                                  host="0.0.0.0"));



