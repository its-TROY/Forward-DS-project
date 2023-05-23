setwd("D:\\Programing\\universty programs\\Rlang\\Forward-DS-project")#diaa
#setwd("C:/Users/divos/Documents/R/forward-project")#youssef
#setwd("C:\\Users\\moham\\OneDrive\\Desktop\\Forward-DS-project")#mohamed
getwd()
myData <- read.csv("Titanic.csv")
library(tidyverse)
library(rpart)
library(rpart.plot)
view(myData)

print(which(duplicated(myData)))
is.na(myData)

myData <- na.omit(myData)
print(which(is.na(myData)))

age_outliers <- boxplot(myData$Age)$out

#Data cleaning
#----------------------------------------------------------
clean_data <- myData[-which(myData$Age %in% age_outliers),]
boxplot(clean_data$Age, main = "Age")

str(clean_data)
train_data <- head(clean_data, n = 229)
test_data <- tail(clean_data, n = 329-229)
#---------------------------------------------------------

view(train_data)
view(test_data)

#Data visualization
#---------------------------------------------------------
hist(clean_data$Age, xlab = "passenger age", main = "Age frequancy")# age freq

survival_females = count(clean_data[which(clean_data$Gender == "female" & clean_data$Survived == 1), ])
survival_males = count(clean_data[which(clean_data$Gender == "male" & clean_data$Survived == 1), ])

survival_females
survival_males

vec <- c(survival_males, survival_females)
vec
pie(vec, main = 'survivals in terms of gender')

#Decision Tree
#------------------------------------------------------------
tree<-rpart(Survived ~ Gender ,data = train_data,minsplit=2)
tree
rpart.plot(tree)

data_to_predict<-data.frame(Gender = "female")
predict(tree,newdata =data_to_predict)

#------------------------------------------------------------