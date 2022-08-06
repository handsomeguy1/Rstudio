library(tidyverse)

#Data Cleaning
t <- Titanic_dataset

t$Survived <- as.factor(t$Survived)
t$SibSp<- as.integer(t$SibSp) 
t$Ticket<- as.character(t$Ticket) 
t$Parch<- as.factor(t$Parch)
t$Sex<- as.factor(t$Sex) 
t$Pclass<- as.factor(t$Pclass)
mean_age <- mean(t$Age, na.rm = T)

#Replacing NA with column mean
t[is.na(t$Age), "Age"] <- mean_age





