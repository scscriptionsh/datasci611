library(shiny);

ui <- fluidPage("Hello World");

server <- function(input,output,session){
  # Does nothing
}

# Start the Server
shinyApp(ui=ui,server=server,
  options=list(port=8080, host="0.0.0.0"));

