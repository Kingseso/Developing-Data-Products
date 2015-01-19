# Developing-Data-Products

##Objective:

This repository is for my Developing Data Products course project where we are required to make and publish a Shiny application.  The server.R and ui.R files have been uploaded to the repository along with the supporting images and Shiny project files.

##Course Requirements:

1.  Write a shiny application with associated supporting documentation. The documentation should be thought of as whatever a user will need to get started using your application.
2.  Deploy the application on Rstudio's shiny server
3.  Share the application link by pasting it into the text box below
4.  Share your server.R and ui.R code on github

The application must include the following:

1.  Some form of input (widget: textbox, radio button, checkbox, ...)
2.  Some operation on the ui input in sever.R
3.  Some reactive output displayed as a result of server calculations
4.  You must also include enough documentation so that a novice user could use your application.
5.  The documentation should be at the Shiny website itself. Do not post to an external link.

The Shiny application in question is entirely up to you. However, if you're having trouble coming up with ideas, you could start from the simple prediction algorithm done in class and build a new algorithm on one of the R datasets packages. Please make the package simple for the end user, so that they don't need a lot of your prerequisite knowledge to evaluate your application. You should emphasize a simple project given the short time frame. 

##Application:

This application predicts the Iris species based on the length and width of a petal using a decision tree generated using Recursive Partitioning and Regression Trees. You can select the petal length and width by moving the Petal Length and Width sliders to your desired value. The dataset used to train the identifier was the Edgar Anderson's Iris Data built into R.

##Generating Decision Tree:

The decision tree was trained using the Edgar Anderson's Iris data set.

The following code generates the decision tree:

library(caret)

`#`Cross validation <br>
set.seed(8) <br>
intrain = createDataPartition(iris$Species, p = 0.75,list=FALSE)   #partition 75% of training data for training <br>
training = iris[intrain,] <br>
testing = iris[-intrain,]

`#`Generate Basic Prediction Tree <br>
modFit <- train(Species ~.,method="rpart",data=iris)

'#'Draw tree <br>
library(rattle) <br>
fancyRpartPlot(modFit$finalModel,sub="RPart Decision Tree for Iris Species")

'#'Generate Confusion Matrix <br>
pred <- predict(modFit,testing) <br>
confusion_matrix <- table(pred,testing$Species) <br>
confusionMatrix(confusion_matrix)
