---
title: "CodeBook.md"
author: "Frederic Anglade"
date: "March 20, 2016"
output: html_document
---



```{r}
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals that I used:
mean(): Mean value
std(): Standard deviation
I create one R script called run_analysis.R that does the following:
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names.
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

1.	Appropriately labels the data set with descriptive variable names in the files.
] "actimeivitimeylabels.timextime"                                                 
 [2] "frequencyeatimeures.timextime"                                                  
 [3] "frequencyeatimeuresinfrequencyo.timextime"                                      
 [4] "README.timextime"                                                               
 [5] "timeestime/Inertimeial Signals/BodyAccelerometimeerxtimeestime.timextime"       
 [6] "timeestime/Inertimeial Signals/BodyAccelerometimeerytimeestime.timextime"       
 [7] "timeestime/Inertimeial Signals/BodyAccelerometimeerztimeestime.timextime"       
 [8] "timeestime/Inertimeial Signals/BodyGyroscopextimeestime.timextime"              
 [9] "timeestime/Inertimeial Signals/BodyGyroscopeytimeestime.timextime"              
[10] "timeestime/Inertimeial Signals/BodyGyroscopeztimeestime.timextime"              
[11] "timeestime/Inertimeial Signals/timeotimealAccelerometimeerxtimeestime.timextime"
[12] "timeestime/Inertimeial Signals/timeotimealAccelerometimeerytimeestime.timextime"
[13] "timeestime/Inertimeial Signals/timeotimealAccelerometimeerztimeestime.timextime"
[14] "timeestime/subjectimetimeestime.timextime"                                      
[15] "timeestime/Xtimeestime.timextime"                                               
[16] "timeestime/ytimeestime.timextime"                                               
[17] "timerain/Inertimeial Signals/BodyAccelerometimeerxtimerain.timextime"           
[18] "timerain/Inertimeial Signals/BodyAccelerometimeerytimerain.timextime"           
[19] "timerain/Inertimeial Signals/BodyAccelerometimeerztimerain.timextime"           
[20] "timerain/Inertimeial Signals/BodyGyroscopextimerain.timextime"                  
[21] "timerain/Inertimeial Signals/BodyGyroscopeytimerain.timextime"                  
[22] "timerain/Inertimeial Signals/BodyGyroscopeztimerain.timextime"                  
[23] "timerain/Inertimeial Signals/timeotimealAccelerometimeerxtimerain.timextime"    
[24] "timerain/Inertimeial Signals/timeotimealAccelerometimeerytimerain.timextime"    
[25] "timerain/Inertimeial Signals/timeotimealAccelerometimeerztimerain.timextime"    
[26] "timerain/subjectimetimerain.timextime"                                          
[27] "timerain/Xtimerain.timextime"                                                   
[28] "timerain/ytimerain.timextime"          

Activity Labels

WALKING` (value `1`): subject was walking during the test
 WALKING_UPSTAIRS` (value `2`): subject was walking up a staircase during the test
WALKING_DOWNSTAIRS` (value `3`): subject was walking down a staircase during the test
 SITTING` (value `4`): subject was sitting during the test
 STANDING` (value `5`): subject was standing during the test
`LAYING` (value `6`): subject was laying down during the test

The complete list of variables of each feature vector is available in 'tidydata.txt'
bject.activity.timeBodyAccelerometer.mean...X.timeBodyAccelerometer.mean...Y.timeBodyAccelerometer.mean...Z.timeBodyAccelerometer.std...X.timeBodyAccelerometer.std...Y.timeBodyAccelerometer.std...Z.timeGravityAccelerometer.mean...X.timeGravityAccel ...


```

