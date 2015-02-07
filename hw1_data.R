#HW1
setwd("/Users/gabrielherrick/DataSci/datasciencecoursera")
hw1_data=read.csv("hw1_data.csv", header=T)
head(hw1_data)
dim(hw1_data)
hw1_data$Ozone[47]
sum(as.numeric(is.na(hw1_data$Ozone)))
mean(hw1_data$Ozone,na.rm=T)
hw1_data_bigO=na.omit(hw1_data[hw1_data$Ozone>31,])
hw1_data_bigOT=na.omit(hw1_data_bigO[hw1_data_bigO$Temp>90,])
mean(hw1_data_bigOT$Solar.R, na.rm=T)
hw1_data_m6=hw1_data[hw1_data$Month==6,]
mean(hw1_data_m6$Temp,na.rm=T)
hw1_data_m5=hw1_data[hw1_data$Month==5,]
max(hw1_data_m5$Ozone, na.rm=T)
