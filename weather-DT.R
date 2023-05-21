setwd("D:\\Programing\\universty programs\\Rlang\\Forward-DS-project")# Diaa
#setwd("C:\\Users\\divos\\Documents\\R\\forward-project")#Youssef
#setwd("")Mohmed
#setwd("D:\\College\\Projects\\Data Science\\Forward-DS-project")#Mahmoud
getwd()
#library(tidyverse)
weather_training<-read.csv("Weather Training Data.csv")

#check duplicates
duplicated(weather_training)
#No duplicatoins

#----------------------------------------------
#check for null values
is.na(weather_training)
weather_training[(is.na(weather_training)),]

#data set has NA values
#remove
weather_training<- na.omit(weather_training)
weather_training

#NA values removed
#----------------------------------------------
#check outliers
#check numeric value
numeric_data <- unlist(lapply(weather_training, is.numeric))
weather_training[,numeric_data]
boxplot(weather_training$MinTemp)
boxplot(weather_training$MaxTemp)


outliers<-boxplot(weather_training$MaxTemp)$out
outliers

weather_training[which(weather_training$MaxTemp %in% outliers),]
clean_data<-weather_training[-which(weather_training$MaxTemp %in% outliers),]
clean_data
#TODO do for all numeric columns
boxplot(clean_data$MaxTemp)




