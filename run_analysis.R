# Load necessary libraries
library(dplyr)

# Define the file URL and filename
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename <- "UCI_HAR_Dataset.zip"

# Download the file if it doesn't already exist
if (!file.exists(filename)){
  download.file(fileURL, filename, method="curl")
}  

# Unzip the file if the folder doesn't already exist
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# Read the activity labels and features
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("class", "activity"))
features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("index", "feature"))

# Read the training data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "class")

# Read the test data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "class")

# Merge the training and test datasets
Subject <- rbind(subject_train, subject_test)
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)

# Combine the subject, activity and measurements data
Merged_Data <- cbind(Subject, Y, X)

# Extract only the measurements on the mean and standard deviation for each measurement
selected_features <- grep("-(mean|std)\\(", features$feature)
Merged_Data <- Merged_Data[, c(1, 2, selected_features + 2)]

# Use descriptive activity names to name the activities in the data set
Merged_Data$class <- activity_labels$activity[Merged_Data$class]

# Appropriately label the data set with descriptive variable names
names(Merged_Data)[1] <- "subject"
names(Merged_Data)[2] <- "activity"
names(Merged_Data)[3:ncol(Merged_Data)] <- gsub("-mean\\(", "Mean", names(Merged_Data)[3:ncol(Merged_Data)])
names(Merged_Data)[3:ncol(Merged_Data)] <- gsub("-std\\(", "STD", names(Merged_Data)[3:ncol(Merged_Data)])
names(Merged_Data)[3:ncol(Merged_Data)] <- gsub("^t", "Time", names(Merged_Data)[3:ncol(Merged_Data)])
names(Merged_Data)[3:ncol(Merged_Data)] <- gsub("^f", "Frequency", names(Merged_Data)[3:ncol(Merged_Data)])
names(Merged_Data)[3:ncol(Merged_Data)] <- gsub("BodyBody", "Body", names(Merged_Data)[3:ncol(Merged_Data)])

# From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject
FinalData <- Merged_Data %>%
  group_by(subject, activity) %>%
    summarise_all(list(~ mean(.)))
# Save the final data to a text file
write.table(FinalData, "FinalData.txt", row.name=FALSE)
#Check variable names
str(FinalData)

#final data
FinalData




