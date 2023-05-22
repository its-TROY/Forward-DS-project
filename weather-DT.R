#setwd("D:\\Programing\\universty programs\\Rlang\\Forward-DS-project")# Diaa
setwd("C:\\Users\\divos\\Documents\\R\\forward-project")#Youssef
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
numeric_data <- select_if(weather_training, is.numeric)


maxTemp_outliers <- boxplot(weather_training$MaxTemp)$out
minTemp_outliers <- boxplot(weather_training$MinTemp)$out
evaporation_outliers <- boxplot(weather_training$Evaporation)$out
sunshine_outliers <- boxplot(weather_training$Sunshine)$out
windspeed_outliers = boxplot(weather_training$WindGustSpeed)$out

clean_data <- weather_training[-which(weather_training$MaxTemp %in% maxTemp_outliers), ]
clean_data = clean_data[-which(clean_data$MinTemp %in% minTemp_outliers), ]
clean_data = clean_data[-which(clean_data$Evaporation %in% evaporation_outliers), ]
clean_data = clean_data[-which(clean_data$Sunshine %in% sunshine_outliers), ]
clean_data = clean_data[-which(clean_data$WindGustSpeed %in% windspeed_outliers), ]



par(
  mfrow = c(3, 2)
)
boxplot(clean_data$MaxTemp, main = "max temp")
boxplot(clean_data$MinTemp, main = "min temp")
boxplot(clean_data$Evaporation, main = "evaporation")
boxplot(clean_data$Sunshine, main = "sunshine")
boxplot(clean_data$WindGustSpeed, main = "wind speed")


#TODO do for all numeric columns




