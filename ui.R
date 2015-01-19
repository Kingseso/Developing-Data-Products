
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Iris Species Identifier"),
  
  # Sidebar with a petal length and width slider inputs, help text and an image of the decision tree
  sidebarPanel(
      
    helpText("This page predicts the Iris species based 
            on the length and width of a petal using a decision tree generated 
            using Recursive Partitioning and Regression Trees.  You can select the petal length and width by
            moving the Petal Length and Width sliders to your desired value.  The dataset used to train the 
             identifier was the Edgar Anderson's Iris Data built into R."),
    sliderInput("petal.length",
                "Petal Length:",
                min = 1,
                max = 7,
                value = 4,
                step = 0.1),
    sliderInput("petal.width",
                "Petal Width:",
                min = 0.1,
                max = 2.5,
                value = 1.3,
                step = 0.1),
    img(src="tree.png", height = 741, width = 437)
  ),
  
  # Show the species name and image of the species of Iris
  mainPanel(
      h3(p('Iris Species')),
      textOutput('species.text'),
      imageOutput("flower")
  )
))
