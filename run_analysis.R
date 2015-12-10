
#
#Some house keeping for maintaining my files
#

mainDir = getwd()
subDir <- "Week3Project"

if (file.exists(subDir)){
    setwd(file.path(mainDir, subDir))
} else {
    dir.create(file.path(mainDir, subDir))
    setwd(file.path(mainDir, subDir))
}

# Download and Unzip File
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile = "./Dataset.zip")
unzip("Dataset.zip")

x_test <- read.table("./UCI HAR Dataset/test/x_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

x_train <- read.table("./UCI HAR Dataset/train/x_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

################################################################################
# 1. Merges the training and the test sets to create one data set.
#
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test )

#Get Features - column headers for x data
x_header <- read.table("./UCI HAR Dataset/features.txt")

################################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each 
# measurement. 
# User regular expression to find "std" and "mean" columns
# Note: \\b marks a word boundry, it will select std() and mean() but
# not meanFreq()
mean_std_cols <- grep("\\bstd\\b|\\bmean\\b",x_header[,2])
x <- x[, mean_std_cols]

################################################################################
# 3. Uses descriptive activity names to name the activities in the data set
# 
names(y) <- "ActivityId"
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <-c("Id", "Activity")

y<- merge(y,activity_labels,by.x="ActivityId",by.y="Id",all=TRUE, sort = FALSE)

################################################################################
# 4. Appropriately labels the data set with descriptive variable names. 
names(x) <- x_header[mean_std_cols,2]

#Subject Name
names(subject) <- "Subject"

# Merger Activity, Subject and Features 
allData <- cbind(Activity=y[,2], subject, x) 
allData.names <- names(allData)

# Tidyup variable names
allData.names <- gsub('BodyBody', 'Body', allData.names)
allData.names <- gsub('-mean', 'Mean', allData.names, ignore.case = F)
allData.names <- gsub('-std', 'Std', allData.names, ignore.case = F)
allData.names <- gsub('[()-]', '', allData.names)

names(allData) <- allData.names

################################################################################
# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject. 
library(plyr)
tidyData <- ddply(allData,.(Activity,Subject), colwise(mean))

write.table(tidyData, "./tidyData.txt", row.names = FALSE)











