
#install packages / load them in
library(shiny)
library(dplyr)
library(plotly)


#creates the shiny server
shinyServer(function(input, output){
  
  #function that creats the plot on a reactive change
  createPlot <- eventReactive(input$species, {
    #reads in iris data
    dni3 <- dimnames(iris3)
    ii <- data.frame(matrix(aperm(iris3, c(1,3,2)), ncol = 4,
                            dimnames = list(NULL, sub(" L.",".Length",
                                                      sub(" W.",".Width", dni3[[2]])))),
                     Species = gl(3, 50, labels = sub("S", "s", sub("V", "v", dni3[[3]]))))
    #if statement to filter down the data
    if(input$species != "all") {
      narrow <- filter(ii, Species == input$species)
    } else {
      narrow <- ii;
    }
  
    #creates the scatter plot
    p <- plot_ly(data = narrow,
                 x = Sepal.Length, 
                 y = Petal.Length, 
                 mode = "markers",
                 color = Species)
    #styles the scatterplot
    layout(p, title = list(input$species), font = list(color = input$colors))
    

  })

  
  #creats the output
  output$trendPlot <- renderPlotly({
    createPlot()
  })
  
})