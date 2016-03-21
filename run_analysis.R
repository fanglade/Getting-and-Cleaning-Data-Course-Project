##You should create one R script called run_analysis.R that does the following.

##Merges the training and the test sets to create one data set.
##Extracts only the measurements on the mean and standard deviation for 
##each measurement.
###Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names.
##From the data set in step 4, creates a second, independent tidy data set 
##with the average of each variable for each activity and each subject.


##Download the data

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="auto")

##Unzip the file

unzip(zipfile="./data/Dataset.zip",exdir="./data")

##unzipped files in the UCI HAR Dataset and get the list of the files

path_rf <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)
files
str(files)
summary(files)
##Read data from the files into the variables
##Read the Activity files

dataActTest  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)

dataActTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)

##Read the Subject files

dataSubjTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)

dataSubjTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)

##Read Fearures files

dataFeatTest  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)

dataFeatTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)

##	Look at the properties of the above variables

str(dataActTest)

str(dataActTrain)

str(dataSubjTrain)

str(dataSubjTest)

str(dataFeatTest)

str(dataFeatTrain)

##1.Merges the training and the test sets to create one data set.
##Concatenate the data tables by rows

dataSubject <- rbind(dataSubjTrain, dataSubjTest)

dataActivity<- rbind(dataActTrain, dataActTest)

dataFeatures<- rbind(dataFeatTrain, dataFeatTest)

##set names to variables

names(dataSubject)<-c("subject")


names(dataActivity)<- c("activity")

dataFeaturesNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)


names(dataFeatures)<- dataFeaturesNames$V2
head(names(dataFeatures), 3)

##Merge columns to get the data frame Data for all data

dataAll <- cbind(dataSubject, dataActivity)

Data <- cbind(dataFeatures, dataAll)



##2. Extracts only the measurements on the mean and standard deviation for 
##each measurement.

subdataFeaturesNames<-dataFeaturesNames$V2[grep("-(mean|std)\\(\\)", dataFeaturesNames$V2)]

##	Subset the data frame Data by seleted names of Features

selectedNames<-c(as.character(subdataFeaturesNames), id=c("subject", "activity") )
##selectedNames

Data<-subset(Data,select=selectedNames)

##	Check the structures of the data frame Data

str(Data)

##3. Uses descriptive activity names to name the activities in the data set
##Read descriptive activity names from "activity_labels.txt"

activity <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)


##	factorize Variable activity in the data frame Data using descriptive activity names
##check

head(activity,20)


##Names of Features will labelled using descriptive variable names.

##	Acc is replaced by Accelerometer
##	Gyro is replaced by Gyroscope
##	body is replaced by Body
##    prefix t is replaced by time
##	prefix f is replaced by frequency
##	Mag is replaced by Magnitude


files<-gsub("acc", "Accelerometer", files)
files<-gsub("gyro", "Gyroscope", files)
files<-gsub("body", "Body",files)
files<-gsub("t", "time",files)
files<-gsub("f", "frequency",files)
files<-gsub("Mag", "Magnitude",files)

##Verify the names change

files

##4. Appropriately labels the data set with descriptive variable names.

gsub("_", "", files)

##5. From the data set in step 4, creates a second, independent tidy data set 
##with the average of each variable for each activity and each subject.

library(plyr);
Data2<-aggregate(.~subject + activity, data=as.data.frame(Data), base::mean)

Data2<-Data2[order(Data2$subject,Data2$activity),]

write.table(Data2, file = "tidydata.txt",row.name=FALSE)

read.csv("tidydata.txt")
