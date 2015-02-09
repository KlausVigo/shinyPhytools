
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(markdown)
tabPanelAbout <- source("about.R")$value


shinyUI(fluidPage(

  # Application title
  titlePanel("shinyPhytools"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),

    # Show a plot of the generated distribution
    mainPanel(
        tabsetPanel(
            tabPanel("Plot", plotOutput("distPlot")),
            tabPanelAbout()
        )    
      
    )
  )
))
