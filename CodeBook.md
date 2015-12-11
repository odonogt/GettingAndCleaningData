
CodeBook for the tidy dataset
=============================

### Data Source

 A full description is available at the site where the data was obtained:  
[Human Activity Recognition](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)  
[Data Zip File](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  

### Unzipped Files
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

### Data of Interest
The following are the features that we are interested in, in order to generate the tidy data:

There are mean and standard deviation values of the following signals for the 3 axis - X, Y and Z :  (2 * 3 * 8 = 48 Features)  
  
1. tBodyAcc  
2. tGravityAcc  
3. tBodyAccJerk  
4. tBodyGyro  
5. tBodyGyroJerk  
6. fBodyAcc  
7. fBodyAccJerk  
8. fBodyGyro  

For example there are variables  tBodyAcc-mean()-X and tBodyAcc-std()-X for the mean and standard deviation for the x-Axis.

For the following there are mean and standard deviation values: (2 * 9 = 18 Features)

1. tBodyAccMag
2. tGravityAccMag
3. tBodyAccJerkMag
4. tBodyGyroMag
5. tBodyGyroJerkMag
6. fBodyAccMag
7. fBodyBodyAccJerkMag
8. fBodyBodyGyroMag
9. fBodyBodyGyroJerkMag


### Variables
x_test type is data.frame  which contains x_test.txt data.
y_test type is data.frame which contains y_test.txt data.
subject_test type is data.frame which contains subject_test.txt data. 
Subject data is just a list of people IDs associated with the data.

x_train type is data.frame  which contains x_train.txt data.
y_train type is data.frame which contains y_train.txt data.
subject_train type is data.frame which contains subject_train.txt data. 

x is a data frame which row combines x_training and x_test
y is a data frame which row combines y_training and y_test
x_header is a data frame which contains the features column names.

activity_labels is a data frame which contains activity_labels.txt data. There are a total of 6 activity types.

allData data frame contains the column combined data from the y, subject and x  data frames.

Finally tidyData is an independent tidy data set with the average of each variable for each activity and each subject.

### Transformations and Code Notes
1. **Finding the required columns in the x data set:**
To find mean() and std() text in the column names - the grep function is used, passing it a regular expression.
The regular expression contains a [Word boundary marker](http://stackoverflow.com/questions/7227976/using-grep-in-r-to-find-strings-as-whole-words-but-not-strings-as-part-of-words).

2. **Merging x, y and subject  training and test data sets.**
activity_labels is  merged  with y to add descriptive activity names to y.
y, subject and x and column combined to generate allData.  Also the Column names are tidied up:
the text -std()replaced with Std
the text -mean() replaced with Mean
and BodyBody replaced with Body
 
3. **Generating tidyData.txt**
The ddply function is used to apply the colwise(mean) function for each Activity/Subject combination.
The tidyData data set is written to tidyData.txt with row.names=FALSE.




