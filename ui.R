library(shiny)
library(plotly)

#creates the shiny UI
shinyUI(fluidPage(
  #title of the page
  titlePanel("Iris Petal and Sepal Length and Width"),
  #creates sidbar panel with 2 widgets
  sidebarPanel(
	  radioButtons("species", "Species Type: ",
	               c("Setosa" = "setosa",
	                 "Versicolor" = "versicolor",
	                 "Virginica" = "virginica",
	                 "All" = "all"),
	               selected = "all"),
	  
	  radioButtons("colors", "Color: ",
	               c("Red" = "red",
	                 "Blue" = "blue",
	                 "Green" = "green"),
	               selected = "red")
  ),
  #creates main panel
  mainPanel(
    plotlyOutput("trendPlot")
  )
  
))