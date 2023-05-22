setwd("D:\\Programing\\universty programs\\Rlang\\Forward-DS-project")
getwd()
myData <- read.csv("Titanic.csv")

view(myData)
print(which(duplicated(myData)))
is.na(myData)

myData <- na.omit(myData)
print(which(is.na(myData)))

age_outliers <- boxplot(myData$Age)$out

clean_data <- myData[-which(myData$Age %in% age_outliers),]
boxplot(clean_data$Age)







