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
        
#-----------histogram----------------
hist(clean_data$Age, xlab = "passenger age", main = "")# age freq

#------------------pie chart----------------
survival_males = as.integer(count(clean_data[which(clean_data$Gender == "male" & clean_data$Survived == 1), ]))
survival_females = as.integer(count(clean_data[which(clean_data$Gender == "female" & clean_data$Survived == 1), ]))
sur_count = count(clean_data[clean_data$Survived == 1, ])
percentage = c(paste0(round(100*survival_males / sur_count), "%"), paste0(round(100*survival_females / sur_count), "%"))

pie(c(survival_males, survival_females), main = 'survivals in terms of gender', labels = percentage, col = c("brown", "lightblue"))
legend("bottomright", legend = c("male", "female"), fill = c("brown", "lightblue"))

#-----------------bar plot------------------
males_fares = clean_data[clean_data$Gender == "male", "Fare"]
females_fares = clean_data[clean_data$Gender == "female", "Fare"]

fares_avg = data.frame(
  males = as.integer(sum(males_fares) / length(males_fares)),
  females = as.integer(sum(females_fares) / length(females_fares))
)
barplot(height = c(fares_avg$males, fares_avg$females), names.arg = c("males", "females"), horiz = T)