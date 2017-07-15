#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  titlePanel("Estimated Miles Per Gallon (MPG) from Weight, Displacement and Number of Cylinders"),
  sidebarLayout(
    sidebarPanel(
       sliderInput("wt",
                   "Weight (1000 lbs):",
                   min = 1,
                   max = 6,
                   value = 3,
                   step=0.5),
       sliderInput("disp",
                   "Displacement:",
                   min = 50,
                   max = 500,
                   value = 230,
                   step=10),
       radioButtons("cyl", label = "Number of Cylinders",
                    choices = list("Four" = 4, "Six" = 6,
                                   "Eight" = 8),selected = 4)
    ),
    mainPanel(
      textOutput("estimated")
    )
  )
))
