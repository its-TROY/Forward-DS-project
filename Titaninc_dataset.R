#setwd("D:\\Programing\\universty programs\\Rlang\\Forward-DS-project")#diaa
#setwd("C:/Users/divos/Documents/R/forward-project")#youssef
setwd("C:\\Users\\moham\\OneDrive\\Desktop\\Forward-DS-project")#mohamed
getwd()
myData <- read.csv("Titanic.csv")
library(rpart)
library(rpart.plot)

print(which(duplicated(myData)))
is.na(myData)

myData <- na.omit(myData)
print(which(is.na(myData)))

age_outliers <- boxplot(myData$Age)$out

clean_data <- myData[-which(myData$Age %in% age_outliers),]
boxplot(clean_data$Age)


hist(clean_data$Age, xlab = "passenger age")# age freq


survival_females = count(clean_data[which(clean_data$Gender == "female" & clean_data$Survived == 1), ])
survival_males = count(clean_data[which(clean_data$Gender == "male" & clean_data$Survived == 1), ])


pie(c(survival_males, survival_females), main = 'survivals in terms of gender')


tree<-rpart(Survived ~Age+Pclass,data = clean_data,minsplit=2)
tree
rpart.plot(tree)

data_to_predict<-data.frame(Age=31,Pclass=1)
predict(tree,newdata =data_to_predict )