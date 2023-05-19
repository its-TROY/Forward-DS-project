#setwd("D:\\Programing\\universty programs\\Rlang\\Forward-DS-project") Diaa
setwd("C:\\Users\\divos\\Documents\\R\\forward-project")#Youssef
#setwd("")Mohmed
setwd("D:\\College\\Projects\\Data Science\\Forward-DS-project")#Mahmoud
getwd()
weather_training<-read.csv("Weather Training Data.csv")
#weather_training
colMeans(weather_training)
table(weather_training$WindGustDir)
