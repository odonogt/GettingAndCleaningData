Getting and Cleaning Data
=========================  

Week 3 Project
--------------

Human Activity Recognition Using Smartphones Data Set.

The following abstract and description has been taken from : [Human Activity Recognition](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

### Abstract: 
Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.  

### Description:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### Files in this Repository:

**run_analysis.R**  does the following:
Creates an directory under the working directory, downloads the zip and and extracts.
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**CodeBook.md** describes the variables, the data, and the transformations required to generate the tidy data set.

**README.md** 



 