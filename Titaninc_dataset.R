#setwd("D:\\Programing\\universty programs\\Rlang\\Forward-DS-project")
setwd("C:/Users/divos/Documents/R/forward-project")#youssef
getwd()
myData <- read.csv("Titanic.csv")

print(which(duplicated(myData)))
is.na(myData)

myData <- na.omit(myData)
print(which(is.na(myData)))

age_outliers <- boxplot(myData$Age)$out

clean_data <- myData[-which(myData$Age %in% age_outliers),]
boxplot(clean_data$Age)
        

hist(clean_data$Age, xlab = "passenger age")# age freq


survival_males = as.integer(count(clean_data[which(clean_data$Gender == "male" & clean_data$Survived == 1), ]))
survival_females = as.integer(count(clean_data[which(clean_data$Gender == "female" & clean_data$Survived == 1), ]))
sur_count = count(clean_data[clean_data$Survived == 1, ])
percentage = c(paste0(round(100*survival_males / sur_count), "%"), paste0(round(100*survival_females / sur_count), "%"))

pie(c(survival_males, survival_females), main = 'survivals in terms of gender', labels = percentage, col = c("lightblue", "pink"))
legend("bottomright", legend = c("male", "female"), fill = c("lightblue", "pink"))