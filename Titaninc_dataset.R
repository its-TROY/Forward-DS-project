#setwd("D:\\Programing\\universty programs\\Rlang\\Forward-DS-project")#diaa
setwd("C:/Users/divos/Documents/R/forward-project")#youssef
#setwd("C:\\Users\\moham\\OneDrive\\Desktop\\Forward-DS-project")#mohamed
getwd()
myData <- read.csv("Titanic.csv")
library(tidyverse)
library(rpart)
library(rpart.plot)
view(myData)

#Data cleaning
#----------------------------------------------------------
print(which(duplicated(myData)))
is.na(myData)

myData <- na.omit(myData)
print(which(is.na(myData)))

age_outliers <- boxplot(myData$Age)$out

clean_data <- myData[-which(myData$Age %in% age_outliers),]
boxplot(clean_data$Age)
        
#------------------pie chart----------------
survival_males = as.integer(count(clean_data[which(clean_data$Gender == "male" & clean_data$Survived == 1), ]))
survival_females = as.integer(count(clean_data[which(clean_data$Gender == "female" & clean_data$Survived == 1), ]))
sur_count = count(clean_data[clean_data$Survived == 1, ])
percentage = c(paste0(round(100*survival_males / sur_count), "%"), paste0(round(100*survival_females / sur_count), "%"))

pie(c(survival_males, survival_females), main = 'survivals in terms of gender', labels = percentage, col = c("brown", "lightblue"))
legend("bottomright", legend = c("male", "female"), fill = c("brown", "lightblue"))



str(clean_data)
train_data <- head(clean_data, n = 229)
test_data <- tail(clean_data, n = 329-229)
#---------------------------------------------------------

#Data visualization
#---------------------------------------------------------
#histogram
hist(clean_data$Age, xlab = "passenger age", main = "Age frequancy")# age freq

#pie chart
survival_females = count(clean_data[which(clean_data$Gender == "female" & clean_data$Survived == 1), ])
survival_males = count(clean_data[which(clean_data$Gender == "male" & clean_data$Survived == 1), ])

survival_females
survival_males

vec <- c(survival_males, survival_females)
vec
pie(vec, main = 'survivals in terms of gender')

#bar plot
males_fares = clean_data[clean_data$Gender == "male", "Fare"]
females_fares = clean_data[clean_data$Gender == "female", "Fare"]

fares_avg = data.frame(
  males = as.integer(sum(males_fares) / length(males_fares)),
  females = as.integer(sum(females_fares) / length(females_fares))
)
barplot(height = c(fares_avg$males, fares_avg$females), names.arg = c("males", "females"), horiz = T)

#box
boxplot(clean_data$Age, main = "Age")

#Decision Tree
#------------------------------------------------------------
tree<-rpart(Survived ~ Gender ,data = train_data,minsplit=2)
tree
rpart.plot(tree)

data_to_predict<-data.frame(Gender = "female")
predict(tree,newdata =data_to_predict)

#------------------------------------------------------------
