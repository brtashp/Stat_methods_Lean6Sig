data=read.csv("climate.csv")
head(data)
str(data)
data$Temp
hist(data$Temp)
summary(data)
cor(data)
plot(data$CO2,data$Temp)
Model=lm(Temp~CO2,data=data)
summary(Model)
Model1=lm(Temp~.,data=data)
summary(Model1)
Model2=lm(Temp~MEI+CO2+TSI,data=data)
summary(Model2)
data$Temp
data$Month
str(data)
data[,11]

tapply(data$Temp,data$Month,mean)
plot(data$Month,data$Temp)
data$Month=as.factor(data$Month)
tapply(data$Temp,data$Month,mean)
plot(data$Month,data$Temp)


tapply(data$Temp,data$Month,max)-tapply(data$Temp,data$Month,min)
