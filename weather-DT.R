#setwd("D:\\Programing\\universty programs\\Rlang\\Forward-DS-project") Diaa
#setwd("C:\\Users\\divos\\Documents\\R\\forward-project")Youssef
#setwd("")Mohmed
#setwd("")Mahmoud
#getwd()
weather_training<-read.csv("Weather Training Data.csv")
#weather_training
table(weather_training$WindGustDir)
barplot(weather_training$WindGustDir,xlab = weather_training$Location, ylab = weather_training$Rainfall)