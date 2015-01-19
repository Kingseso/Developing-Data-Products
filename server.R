
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyServer(function(input, output) {
  
    #Decision tree
    m <- reactive({if (input$petal.length < 2.4)
        {
            x <- "Setosa"
        } else if (input$petal.width < 1.8) {
            x <- "Versicolor"
        } else {
            x <- "Virginica"
        }
    })
output$species.text <-  renderText({m()})  #write decision to species textbox

#Update image based on species identified
output$flower  <- renderImage({    
   return(list(src = paste("www/",m(),".jpg", sep=""),
               filetype ="image/jpeg"))
}, deleteFile = FALSE)


})
