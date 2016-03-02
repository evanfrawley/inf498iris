#
library(shiny)

shinyUI(fluidPage(
  
  titlePanel("This is my title panel"),
  
  actionButton("render", "Plot"),
  mainPanel(
    plotOutput("plot")
  )
  
))