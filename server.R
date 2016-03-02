#server.R

library(shiny)
library(dplyr)
library(plotly)

shinyServer(function(input, output){
  
  createPlot <- eventReactive(input$render, {
  
    plot_ly(data = iris, x = Sepal.Length, y = Petal.Length, mode = "markers",
          color = Species)
  
  })

  


  output$plot <- renderPlot({
    createPlot()
  })

})