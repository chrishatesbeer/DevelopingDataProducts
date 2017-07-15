#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
mtcars$cyl <- as.factor(mtcars$cyl)
model = lm(mpg ~ wt + disp + cyl, data=mtcars)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$estimated <- renderText({
    newcar = data.frame(wt=input$wt, disp=input$disp, cyl=factor(input$cyl))
    paste(round(predict(model, newcar), digits=2), " estimated MPG for a car with ",input$cyl, " cylinders, weighing ",  input$wt, " tonnes and a displacement of ", input$disp )
    })
})
