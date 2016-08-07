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
 [1] "TotalBodyAccelerationMean-X"                            
 [2] "TotalBodyAccelerationMean-Y"                            
 [3] "TotalBodyAccelerationMean-Z"                            
 [4] "TotalBodyAcceleration-std-X"                            
 [5] "TotalBodyAcceleration-std-Y"                            
 [6] "TotalBodyAcceleration-std-Z"                            
 [7] "TotalGravityAccelerationMean-X"                         
 [8] "TotalGravityAccelerationMean-Y"                         
 [9] "TotalGravityAccelerationMean-Z"                         
[10] "TotalGravityAcceleration-std-X"                         
[11] "TotalGravityAcceleration-std-Y"                         
[12] "TotalGravityAcceleration-std-Z"                         
[13] "TotalBodyAccelerationJerkMean-X"                        
[14] "TotalBodyAccelerationJerkMean-Y"                        
[15] "TotalBodyAccelerationJerkMean-Z"                        
[16] "TotalBodyAccelerationJerk-std-X"                        
[17] "TotalBodyAccelerationJerk-std-Y"                        
[18] "TotalBodyAccelerationJerk-std-Z"                        
[19] "TotalBodyGyroscopeMean-X"                               
[20] "TotalBodyGyroscopeMean-Y"                               
[21] "TotalBodyGyroscopeMean-Z"                               
[22] "TotalBodyGyroscope-std-X"                               
[23] "TotalBodyGyroscope-std-Y"                               
[24] "TotalBodyGyroscope-std-Z"                               
[25] "TotalBodyGyroscopeJerkMean-X"                           
[26] "TotalBodyGyroscopeJerkMean-Y"                           
[27] "TotalBodyGyroscopeJerkMean-Z"                           
[28] "TotalBodyGyroscopeJerk-std-X"                           
[29] "TotalBodyGyroscopeJerk-std-Y"                           
[30] "TotalBodyGyroscopeJerk-std-Z"                           
[31] "TotalBodyAccelerationelerationMagnitudenitudeMean"      
[32] "TotalBodyAccelerationelerationMagnitudenitudeStdDev"    
[33] "TotalGravityAccelerationelerationMagnitudenitudeMean"   
[34] "TotalGravityAccelerationelerationMagnitudenitudeStdDev" 
[35] "TotalBodyAccelerationJerkMagnitudenitudeMean"           
[36] "TotalBodyAccelerationJerkMagnitudenitudeStdDev"         
[37] "TotalBodyGyroscopeMagnitudeMean"                        
[38] "TotalBodyGyroscopeMagnitudeStdDev"                      
[39] "TotalBodyGyroscopeJerkMagnitudenitudeMean"              
[40] "TotalBodyGyroscopeJerkMagnitudenitudeStdDev"            
[41] "FrequencyBodyAccelerationMean-X"                        
[42] "FrequencyBodyAccelerationMean-Y"                        
[43] "FrequencyBodyAccelerationMean-Z"                        
[44] "FrequencyBodyAcceleration-std-X"                        
[45] "FrequencyBodyAcceleration-std-Y"                        
[46] "FrequencyBodyAcceleration-std-Z"                        
[47] "FrequencyBodyAccelerationJerkMean-X"                    
[48] "FrequencyBodyAccelerationJerkMean-Y"                    
[49] "FrequencyBodyAccelerationJerkMean-Z"                    
[50] "FrequencyBodyAccelerationJerk-std-X"                    
[51] "FrequencyBodyAccelerationJerk-std-Y"                    
[52] "FrequencyBodyAccelerationJerk-std-Z"                    
[53] "FrequencyBodyGyroscopeMean-X"                           
[54] "FrequencyBodyGyroscopeMean-Y"                           
[55] "FrequencyBodyGyroscopeMean-Z"                           
[56] "FrequencyBodyGyroscope-std-X"                           
[57] "FrequencyBodyGyroscope-std-Y"                           
[58] "FrequencyBodyGyroscope-std-Z"                           
[59] "FrequencyBodyAccelerationelerationMagnitudenitudeMean"  
[60] "FrequencyBodyAccelerationelerationMagnitudenitudeStdDev"
[61] "FrequencyBodyAccelerationJerkMagnitudenitudeMean"       
[62] "FrequencyBodyAccelerationJerkMagnitudenitudeStdDev"     
[63] "FrequencyBodyGyroscopeMagnitudeMean"                    
[64] "FrequencyBodyGyroscopeMagnitudeStdDev"                  
[65] "FrequencyBodyGyroscopeJerkMagnitudenitudeMean"          
[66] "FrequencyBodyGyroscopeJerkMagnitudenitudeStdDev"        
[67] "activity"                                               
[68] "subject"            
 
Activity Labels:
 
 WALKING` (value `1`): subject was walking during the test
  WALKING_UPSTAIRS` (value `2`): subject was walking up a staircase during the test
 WALKING_DOWNSTAIRS` (value `3`): subject was walking down a staircase during the test
  SITTING` (value `4`): subject was sitting during the test
 STANDING` (value `5`): subject was standing during the test
 `LAYING` (value `6`): subject was laying down during the test
 
 The complete list of variables of each feature vector in 'tidydata.txt'
 activity" "TotalBodyAccelerationMean-X" "TotalBodyAccelerationMean-Y" "TotalBodyAccelerationMean-Z" "TotalBodyAcceleration-std-X" "TotalBodyAcceleration-std-Y" "TotalBodyAcceleration-std-Z" "TotalGravityAccelerationMean-X" "TotalGravityAccelerationMean-Y" "TotalGravityAccelerationMean-Z" "TotalGravityAcceleration-std-X" "TotalGravityAcceleration-std-Y" "TotalGravityAcceleration-std-Z" "TotalBodyAccelerationJerkMean-X" "TotalBodyAccelerationJerkMean-Y" "TotalBodyAccelerationJerkMean-Z" "TotalBodyAccelerationJerk-std-X" "TotalBodyAccelerationJerk-std-Y" "TotalBodyAccelerationJerk-std-Z" "TotalBodyGyroscopeMean-X" "TotalBodyGyroscopeMean-Y" "TotalBodyGyroscopeMean-Z" "TotalBodyGyroscope-std-X" "TotalBodyGyroscope-std-Y" "TotalBodyGyroscope-std-Z" "TotalBodyGyroscopeJerkMean-X" "TotalBodyGyroscopeJerkMean-Y" "TotalBodyGyroscopeJerkMean-Z" "TotalBodyGyroscopeJerk-std-X" "TotalBodyGyroscopeJerk-std-Y" "TotalBodyGyroscopeJerk-std-Z" "TotalBodyAccelerationelerationMagnitudenitudeMean" "TotalBodyAccelerationelerationMagnitudenitudeStdDev" "TotalGravityAccelerationelerationMagnitudenitudeMean" "TotalGravityAccelerationelerationMagnitudenitudeStdDev" "TotalBodyAccelerationJerkMagnitudenitudeMean" "TotalBodyAccelerationJerkMagnitudenitudeStdDev" "TotalBodyGyroscopeMagnitudeMean" "TotalBodyGyroscopeMagnitudeStdDev" "TotalBodyGyroscopeJerkMagnitudenitudeMean" "TotalBodyGyroscopeJerkMagnitudenitudeStdDev" "FrequencyBodyAccelerationMean-X" "FrequencyBodyAccelerationMean-Y" "FrequencyBodyAccelerationMean-Z" "FrequencyBodyAcceleration-std-X" "FrequencyBodyAcceleration-std-Y" "FrequencyBodyAcceleration-std-Z" "FrequencyBodyAccelerationJerkMean-X" "FrequencyBodyAccelerationJerkMean-Y" "FrequencyBodyAccelerationJerkMean-Z" "FrequencyBodyAccelerationJerk-std-X" "FrequencyBodyAccelerationJerk-std-Y" "FrequencyBodyAccelerationJerk-std-Z" "FrequencyBodyGyroscopeMean-X" "FrequencyBodyGyroscopeMean-Y" "FrequencyBodyGyroscopeMean-Z" "FrequencyBodyGyroscope-std-X" "FrequencyBodyGyroscope-std-Y" "FrequencyBodyGyroscope-std-Z" "FrequencyBodyAccelerationelerationMagnitudenitudeMean" "FrequencyBodyAccelerationelerationMagnitudenitudeStdDev" "FrequencyBodyAccelerationJerkMagnitudenitudeMean" "FrequencyBodyAccelerationJerkMagnitudenitudeStdDev" "FrequencyBodyGyroscopeMagnitudeMean" "FrequencyBodyGyroscopeMagnitudeStdDev" "FrequencyBodyGyroscopeJerkMagnitudenitudeMean" "FrequencyBodyGyroscopeJerkMagnitudenitudeStdDev"