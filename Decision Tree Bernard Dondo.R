
#Read Iris Dataset
data(iris)

#view Data Structure
str(iris)

#Shuffle Data
shuffle_index <- sample(1:nrow(iris))

#Using the index to shuffle the observations
iris <- iris[shuffle_index, ]
head(iris)

#Install DPLR Package
install.packages("dplyr")
library(dplyr)

set.seed(123)
nrow(iris)
train_sample <- sample(105, 45)
str(train_sample)
# split the data frames
iris_train <- iris[train_sample, ]
iris_test  <- iris[-train_sample, ] 
# Create our model using rpart
install.packages("rpart")
install.packages("rpart.plot")

library(rpart)
library(rpart.plot)
fit <- rpart(Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, data = iris_train, method = 'class')
# In rpart it is easier to plot the tree
rpart.plot(fit)

predict_unseen <-predict(fit, iris_test, type = 'class')
install.packages('caret')
library(caret)

#Confusion Matrix
confusionMatrix(iris_test$Species, predict_unseen)
