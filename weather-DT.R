#setwd("D:\\Programing\\universty programs\\Rlang\\Forward-DS-project") Diaa
setwd("C:\\Users\\divos\\Documents\\R\\forward-project")#Youssef
#setwd("")Mohmed
setwd("D:\\College\\Projects\\Data Science\\Forward-DS-project")#Mahmoud
getwd()
library(tidyverse)
weather_training<-read.csv("Weather Training Data.csv")
#weather_training

mintTempAvg <- mean(weather_training$MinTemp, na.rm = T)
mintTempAvg
maxTempAvg <- mean(weather_training$MaxTemp, na.rm = T)
maxTempAvg
rainFallAvg <- mean(weather_training$Rainfall, na.rm = T)
rainFallAvg
evapAvg <- mean(weather_training$Evaporation, na.rm = T)
evapAvg
sunshinAvg <- mean(weather_training$Sunshine, na.rm = T)
windSpeed9 <- mean(weather_training$WindSpeed9am, na.rm = T)
windspeed3 <- mean(weather_training$WindDir3pm, na.rm = T)

hum9avg <- mean(weather_training$Humidity9am, na.rm = T)
hum3avg <- mean(weather_training$Humidity3pm, na.rm = T)

pres9Avg <- mean(weather_training$Pressure9am, na.rm = T)
pres3Avg <- mean(weather_training$Pressure9am, na.rm = T)

cloud9Avg<- mean(weather_training$Cloud9am, na.rm = T)
cloud3Avg <- mean(weather_training$Cloud3pm, na.rm = T)

temp9Avg <- mean(weather_training$Temp9am, na.rm = T)
temp3Avg <- mean(weather_training$Temp3pm, na.rm = T)

weather_training %>% 
  select(MinTemp, MaxTemp, Rainfall, Evaporation, Sunshine, WindSpeed9am, WindSpeed3pm, Humidity9am, Humidity3pm
         ,Pressure9am, Pressure3pm, Cloud9am, Cloud3pm, Temp9am, Temp3pm) %>% 
  mutate(MinTemp = replace_na(MinTemp, mintTempAvg)) %>%
  mutate(MaxTemp = replace_na(MaxTemp, maxTempAvg)) %>%
  mutate(Rainfall = replace_na(Rainfall, rainFallAvg)) %>%
  
  mutate(Evaporation = replace_na(Evaporation, evapAvg)) %>%
  mutate(Sunshine = replace_na(Sunshine, sunshinAvg)) %>%
  mutate(WindSpeed9am = replace_na(WindSpeed9am, windSpeed9)) %>%
  
  mutate(WindSpeed3pm = replace_na(WindSpeed3pm, windspeed3)) %>%
  mutate(Humidity9am = replace_na(Humidity9am, hum9avg)) %>%
  mutate(Humidity3pm = replace_na(Humidity3pm, hum9avg)) %>%
  
  mutate(Pressure9am = replace_na(Pressure9am, pres9Avg)) %>%
  mutate(Pressure3pm = replace_na(Pressure3pm, pres3Avg)) %>%
  mutate(Cloud9am = replace_na(Cloud9am, cloud9Avg)) %>%
  
  mutate(Cloud3pm = replace_na(Cloud3pm, cloud3Avg)) %>%
  mutate(Temp9am = replace_na(Temp9am, temp9Avg)) %>%
  mutate(Temp3pm = replace_na(temp3pm, temp3Avg)) 



table(weather_training$WindGustDir)
