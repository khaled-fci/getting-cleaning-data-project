setwd("D:/Khaled/Non-Work/Lab/32.R/Getting and Cleaning Data/Project")

library(data.table)
library(dplyr)

featuresDF <- read.table("./data/features.txt")
featuresVect <- as.vector(featuresDF[,2])
featuresVect <- append("Activity", featuresVect)
featuresVect <- append("Subject", featuresVect)

activityLabelsDF <- read.table("./data/activity_labels.txt")

xTrain <- read.table("./data/train/X_train.txt")

yTrain <- read.table("./data/train/Y_train.txt")

sTrain <- read.table("./data/train/subject_train.txt")

xTest <- read.table("./data/test/X_test.txt")


yTest <- read.table("./data/test/Y_test.txt")


sTest <- read.table("./data/test/subject_test.txt")


train <- cbind(sTrain, yTrain, xTrain)

test <- cbind(sTest, yTest, xTest)

data <- rbind(train, test)

colnames(data) <- featuresVect

keepCols <- grepl("Activity|Subject|.*?-mean.*|.*?-std.*", featuresVect)

data <- data[keepCols]

data$Activity <- mapvalues(data$Activity, from=activityLabelsDF[,1], to=as.vector(activityLabelsDF[,2]))

colNames <- gsub("^t","Time-", colnames(data))
colNames <- gsub("^f","FFT-", colNames)
colNames <- gsub("-mean\\(\\)","Mean", colNames)
colNames <- gsub("-std\\(\\)","Std", colNames)

colnames(data) <- colNames

tidy <- aggregate(data[,3:length(colNames)], by=list(Subject = data$Subject, Activity = data$Activity), mean)

# tidy <- group_by(data, Subject, Activity)
# 
# tidy <- summarise_each(tidy, funs(mean), 3:length(colNames))

# write.table(tidy, "./tidy.csv", sep=",")

write.table(tidy, './tidy.txt',row.names=FALSE,sep=',');
