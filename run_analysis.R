

## Getting and Cleaning Data Course Project

# Frederic Anglade

## You should create one R script called run_analysis.R that does the following.

## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for 
## each measurement.
## Uses descriptive activity names to name the activities in the data set
#  appropriately labels the data set with descriptive variable names.
## From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.

# Run_analysis


#set working directory to the location where the UCI HAR Dataset was unzipped.
setwd( "C:/Users/Frederic/Downloads/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset" )

################################################################################
#1. Merge the training and the test sets to create one data set.
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")


x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Concatenate the data tables by rows.
# Create x_data set.
x_data <- rbind(x_train, x_test)


# Create y_data set.
y_data <- rbind(y_train, y_test)


# Create subject_data set.
subject_data <- rbind(subject_train, subject_test)


# 2. Extract only the measurements on the mean and standard deviation for each 
# measurement.
###############################################################################

features <- read.table("features.txt")

# get only columns with mean() or std() in their names
datams <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
x_data <- x_data[, datams]

# correct the column names
names(x_data) <- features[mean_and_std_features, 2]


##########################################################################
#3. Uses descriptive activity names to name the activities in the data set.

#Read descriptive activity names from "activity_labels.txt"
activities <- read.table("activity_labels.txt")

# Update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# Correct column name.
names(y_data) <- "activity"



###############################################################################

# 4. Appropriately label the data set with descriptive variable names.

# Correct column name.
names(subject_data) <- "subject"


# Bind all the data in a single data set.
data3 <- cbind(x_data, y_data, subject_data)

# Updating the colNames vector to include the new column names after merge.
colNames  = colnames(data3)

# Cleaning up the variable names
for (i in 1:length(colNames)) 
{
      colNames[i] = gsub("\\()","",colNames[i])
      colNames[i] = gsub("-std$","StdDev",colNames[i])
      colNames[i] = gsub("-mean","Mean",colNames[i])
      colNames[i] = gsub("^(t)","Total",colNames[i])
      colNames[i] = gsub("^(f)","Frequency",colNames[i])
      colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
      colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
      colNames[i] = gsub("[Gg]yro","Gyroscope",colNames[i])
      colNames[i] = gsub("AccMag","AccelerationMagnitude",colNames[i])
      colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
      colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
      colNames[i] = gsub("GyroMag","GyroscopeMagnitude",colNames[i])
      colNames[i] = gsub("Acc","Acceleration",colNames[i])
      colNames[i] = gsub("Mag","Magnitude",colNames[i])
}


# Reassigning the new descriptive column names to the data3 set.
colnames(data3) = colNames;

###############################################################################

#5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.


tidyData <- ddply(data3, .(subject, activity), function(x) colMeans(x[, 1:66]))


write.table(tidyData, "tidyData.txt", row.name=FALSE)

read.csv("tidyData.txt")












































