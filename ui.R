
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
      fileInput('fileTree', 'Import tree file'),
      fileInput('fileCSV', 'Choose CSV File',
          accept=c('text/csv', 
             'text/comma-separated-values,text/plain', '.csv')),
      actionButton("refreshButton", icon("refresh")),
      
      uiOutput('chooseVar'),

#Tree type
      HTML("<div id=\"ptype\" class=\"btn-group\">
           <button id=\"phylogram\"  type=\"button\" class=\"btn action-button\">\n  <img src=\"../phylogram.png\" width=\"40\" height=\"40\" alt=\"phylogram\"/>\n</button>\n
           <button id=\"fan\" type=\"button\" class=\"btn action-button\">\n  <img src=\"../fan.png\" width=\"40\" height=\"40\" alt=\"fan\"/>\n</button>
           </div>"),
#Direction for phylogramm 
      uiOutput('direction'),
#Fonts for Labels
      HTML("<div id=\"font\" class=\"btn-group\">
<button id=\"font1\"  type=\"button\" class=\"btn action-button\">\n  <img src=\"../font1.svg\" width=\"40\" height=\"40\" alt=\"font1\"/>\n</button>\n
<button id=\"font2\" type=\"button\" class=\"btn action-button\">\n  <img src=\"../font2.svg\" width=\"40\" height=\"40\" alt=\"font2\"/>\n</button>
<button id=\"font3\" type=\"button\" class=\"btn action-button\">\n  <img src=\"../font3.svg\" width=\"40\" height=\"40\" alt=\"font3\"/>\n</button>
<button id=\"font4\"type=\"button\" class=\"btn action-button\">\n  <img src=\"../font4.svg\" width=\"40\" height=\"40\" alt=\"font4\"/>\n</button>
</div>")      
      
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
