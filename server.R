library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {
  output$table <- renderDataTable({
    disp_seq <- seq(from = input$disp[1], to = input$disp[2], by = 0.1)
    hp_seq <- seq(from = input$hp[1], to = input$hp[2], by = 1)
    d<- transmute(mtcars, Car = rownames(mtcars), Miles = mpg, 
                      Gasoline = input$dis/mpg*input$cost,
                      Cyl= cyl)
    d <- filter(d, Gasoline <= input$gas, Cyl %in% input$cyl )
  
    d <- arrange(d, Gasoline)
    d
  }, options = list(lengthMenu = c(5), pageLength = 5))
})