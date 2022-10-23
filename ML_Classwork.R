##################################
# Machine Learning with R        #
# Date: 23rd October, 2022       #
# Data Science Mar'2022 Class    #
##################################

# Import libraries
install.packages("mlbench")
library (mlbench)
install.packages("caret")
library(caret)


# Load the BostonHousing dataset
data (BostonHousing)

# visualize the data
hist(BostonHousing$age)
plot(BostonHousing$age)

# Split the dataset using stratify random sampling
myData <- createDataPartition(BostonHousing$med, p = 0.8, list = FALSE)


#Visualize the training data of 80% 
hist(myData)
plot(myData)

Training_Dataset <- BostonHousing[myData,]
Testing_Dataset <- BostonHousing[-myData,]

# Time to build our Linear Regression Model
Model <-  train(
  medv ~.,
  data = Training_Dataset,
  na.action = na.omit,  # to treat non-available variables.
  preProcess = c("scale", "center"),
  method = "lm",
  trControl = trainControl(method = "none")
  
)
# It's time to predict using our model
Model.Training <- predict(Model, Training_Dataset)
Model.Testing <- predict(Model, Testing_Dataset)

#Model summary
summary(Model)
