
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(phytools)

readTrees <- function(file, format="phylip"){
  if(format=="phylip")tree = read.tree(file)
  else tree = read.nexus(file)
#  if(class(tree)=="phylo")tree = list(tree)
  tree
}

shinyServer(function(input, output) {

  treeInput <- reactive({
    inFile <- input$fileTree
    if (is.null(inFile))
      return(NULL)
    tmp = strsplit(tolower(input$fileTree$name), "[.]")[[1]]
    tmp = tmp[length(tmp)]
    if(is.na(pmatch("nex", tmp)))xx$format="phylip"
    else xx$format="nexus"
    readTrees(input$fileTree$datapath, xx$format)
  })


  dataInput <- reactive({
    inFile <- input$fileCSV
    if (is.null(inFile))
      return(NULL)
    read.csv(inFile$datapath, row.names=1)
  })
  
  D <- reactiveValues()
  D$colnames=NULL
  observe({
    if(input$refreshButton){ 
      D$data <- dataInput()
      D$colnames <- colnames(D$data)
      D$rownames <- rownames(D$data)
      D$disCont <- sapply(D$data, "class")
      names(D$disCont) <- D$colnames
    }                      
  })
 #    input$chooseVar
  
  
#  X <- reactiveValues()
#  X$tree <- treeInput()
  
    xx <- reactiveValues()
    xx$format <- "phylip"
    xx$type <- "phylogram"
    xx$font <- 1
    xx$phyloOrClado <- TRUE
    xx$varnames <- NULL
    observe({
        if (input$phylogram != 0) {
            xx$type <- "phylogram"
            xx$phyloOrClado <- TRUE
        }
    })
    observe({
       if (input$fan != 0) {
           xx$type <- "fan"
           xx$phyloOrClado <- FALSE
           }
    })
    
    output$chooseVar <- renderUI({
         if(length(D$colnames) > 0)
         selectInput('chooseVar', 'Choose Variable', D$colnames)
    })

    output$direction <- renderUI({
       if(xx$type == 'phylogram' || xx$type == 'cladogram')
           selectInput('direction', 'Direction',
                c('rightwards', 'leftwards', 'upwards', 'downwards'))
       })


#  X <- reactiveValues()
#  X$tree <- treeInput()


output$distPlot <- renderPlot({
  #browser()
  tree <- treeInput()  
#  print(input$chooseVar)
  tmp <- D$disCont[input$chooseVar]
print(tmp == "factor")
  if(tmp=="factor"){
    x<-as.matrix(D$data)[,input$chooseVar]
#    print(length(x))
    mtrees<-make.simmap(tree,x,nsim=100)
    dMap<-densityMap(mtrees, plot=FALSE)
    plot(dMap, type=xx$type, direction=input$direction)
  }
#  else{
    plot(tree, type=xx$type, direction=input$direction)
#  }

  })

})
