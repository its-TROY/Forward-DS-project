setwd("D:\\Programing\\universty programs\\Rlang\\Forward-DS-project")# Diaa
#setwd("C:\\Users\\divos\\Documents\\R\\forward-project")#Youssef
#setwd("")Mohmed
#setwd("D:\\College\\Projects\\Data Science\\Forward-DS-project")#Mahmoud
getwd()
#library(tidyverse)
weather_training<-read.csv("Weather Training Data.csv")

boxplot(weather_training$Evaporation)
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
windsGpeed_outliers = boxplot(weather_training$WindGustSpeed)$out

windspeed9am_outliers <- boxplot(weather_training$WindSpeed9am)$out
windspeed3pm_outliers <- boxplot(weather_training$WindDir3pm)$out
hum9am_outliers <- boxplot(weather_training$Humidity9am)$out
hum3pm_outliers <- boxplot(weather_training$Humidity3pm)$out
pres9am_outliers <- boxplot(weather_training$Pressure9am)$out
pres3pm_outliers <- boxplot(weather_training$Pressure3pm)$out
cloud9am_outliers <- boxplot(weather_training$Cloud9am)$out
cloud3pm_outliers <- boxplot(weather_training$Cloud3pm)$out
temp9am_outliers <- boxplot(weather_training$Temp9am)$out
temp3pm_outliers <- boxplot(weather_training$Temp3pm)$out



clean_data_maxTemp <- weather_training[-which(weather_training$MaxTemp %in% maxTemp_outliers), ]
clean_data_minTemp <- weather_training[-which(weather_training$MinTemp %in% minTemp_outliers), ]
clean_data_ev <- weather_training[-which(weather_training$Evaporation %in% evaporation_outliers), ]

clean_data_windGSpeed <- weather_training[-which(weather_training$WindGustSpeed %in% windspeed_outliers), ]

clean_data_windSpeed9am <- weather_training[-which(weather_training$WindSpeed9am %in% windspeed9am_outliers), ]
clean_data_windSpeed3pm <- weather_training[-which(weather_training$WindSpeed3pm %in% windspeed3pm_outliers), ]
clean_data_hun9am <- weather_training[-which(weather_training$Humidity9am %in% hum9am_outliers), ]
clean_data_hum3pm <- weather_training[-which(weather_training$Humidity3pm %in% hum3pm_outliers), ]
clean_data_pres9am <- weather_training[-which(weather_training$Pressure9am %in% pres9am_outliers), ]
clean_data_pres3pm <- weather_training[-which(weather_training$Pressure3pm %in% pres3pm_outliers), ]
clean_data_cloud9am <- weather_training[-which(weather_training$Cloud9am %in% cloud9am_outliers), ]
clean_data_cloud3pm <- weather_training[-which(weather_training$Cloud3pm %in% cloud3pm_outliers), ]
clean_data_temp9am <- weather_training[-which(weather_training$Temp9am %in% temp9am_outliers), ]
clean_data_temp3pm <- weather_training[-which(weather_training$Temp3pm %in% temp3pm_outliers), ]


par(mfrow = c(3, 5))

boxplot(clean_data_maxTemp$MaxTemp, main = "MaxTemp")
boxplot(clean_data_minTemp$MinTemp, main = "MinTemp")
boxplot(clean_data_ev$Evaporation, main = "Evap", outline = F)

boxplot(clean_data_windGSpeed$WindGustSpeed, main = "wind gust speed")

boxplot(clean_data_minTemp$WindSpeed9am, main = "wind speed 9am")
boxplot(clean_data_minTemp$WindSpeed3pm, main = "wind speed 3pm")
boxplot(clean_data_minTemp$Humidity9am, main = "humidity 9am")
boxplot(clean_data_minTemp$Humidity3pm, main = "humidity 3pm")
boxplot(clean_data_minTemp$Pressure9am, main = "pressure 9am")

boxplot(clean_data_minTemp$Pressure3pm, main = "pressure 3pm")
boxplot(clean_data_minTemp$Cloud9am, main = "cloud 9am")
boxplot(clean_data_minTemp$Cloud3pm, main = "cloud 3am")
boxplot(clean_data_minTemp$Temp9am, main = "temp 9am")
boxplot(clean_data_minTemp$Temp3pm, main = "temp 3pm")



#TODO do for all numeric columns




