## CodeBook: Data Science Specialization course series: Getting and Cleaning Data Course Project

============================================================================================
### Original raw data sets: Human Activity Recognition Using Smartphones Dataset Version 1.0:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws

A full description is available at the site www.smartlab.ws where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

-------------------------------------------------------------------------------------------------
#### List of the original data sets inside the downloaded zip file:

 	 - 'README.txt': describes about the general information and background related to the data sets within the zip file.
	
 	 - 'features_info.txt': Shows information about the variables used on the feature vector.

   	 - 'features.txt': List of all features.

   	 - 'activity_labels.txt': Links the class labels with their activity name.

   	 - 'train/X_train.txt': Training set.

   	 - 'train/y_train.txt': Training labels.

   	 - 'test/X_test.txt': Test set.

   	 - 'test/y_test.txt': Test labels.
   
    	 - 'train/subject_train.txt':   Each row identifies the subject who performed the activity for each window sample.
            Its range is from 1 to 30. (for training set)
   
  	 - 'test/subject_test.txt':  Each row identifies the subject who performed the activity for each window sample.
  	    Its range is from 1 to 30. (for test set)
      
   	  The following data sets are not been used in the current project. 

   	 - 'train/Inertial Signals/total_acc_x_train.txt'; 'train/Inertial Signals/body_acc_x_train.txt';
   	   'train/Inertial Signals/body_gyro_x_train.txt'. More information related to these three data sets can be
   	    found in 'README.txt', 'feature_info.txt' and 'feature.txt' and the original website.
    
-------------------------------------------------------------------------------------------------------------
#### Background: feature selection, feature vector variables and unit

The following information is the hightlights/summary of the 'feature_info.txt' and 'feature.txt'

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
>Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
>wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope,
>they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
>The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly
>partitioned into two sets, where 70% of the volunteers was selected for generating the training data
>and 30% the test data.
>
>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ 
>and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
>Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency
>of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration
>signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals
>(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated 
>using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ,
>fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
>(Note the 'f' to indicate frequency domain signals). 

>
>	Additional vectors obtained by averaging the signals in a signal window sample. 
>	These are used on the angle() variable:
>
>		gravityMean
>		tBodyAccMean
>		tBodyAccJerkMean
>		tBodyGyroMean
>		tBodyGyroJerkMean
>
>	The set of variables that were estimated from these signals are: 
>
>		mean(): Mean value
>		std(): Standard deviation
>		mad(): Median absolute deviation 
>		max(): Largest value in array
>		min(): Smallest value in array
>		sma(): Signal magnitude area
>		energy(): Energy measure. Sum of the squares divided by the number of values. 
>		iqr(): Interquartile range 
>		entropy(): Signal entropy
>		arCoeff(): Autorregresion coefficients with Burg order equal to 4
>		correlation(): correlation coefficient between two signals
>		maxInds(): index of the frequency component with largest magnitude
>		meanFreq(): Weighted average of the frequency components to obtain a mean frequency
>		skewness(): skewness of the frequency domain signal 
>		kurtosis(): kurtosis of the frequency domain signal 
>		bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
>		angle(): Angle between to vectors.

##### Unit:

Features are normalized and bounded within [-1,1]. In other words, they are unitless.


### Tidy data sets

#### Tiday data set: new variable names

* New variable names were from selected input data variables (see previous section)
* The names were modified mainly to avoid any unnecessary errors in R when this tidy data set 
  is used as an input data during any data analysis in the future. The methods and reasons are 
  based on the instruction from the course video-sildes (Week 4: Editing text variables).
  
  + The following were modified:
    -- lower cases; removed bad characters "()"; replaced "-" to "."

* The activity names are also be modified such as: lower cases; removed "_"
  new activity names: laying, sitting, standing, walking, walkingdownstairs and walkingupstairs.
  
-------------------------------------------------------------------------------------------------------------
#### Tidy data set: data structure

* There are 180 observations of 68 variables.

		'data.frame':	180 obs. of  68 variables:
		 $ activity                 : chr  
		 $ subject                  : int  
		 $ tbodyacc.mean.x          : num 
		 $ tbodyacc.mean.y          : num  
		 $ tbodyacc.mean.z          : num  
		 $ tbodyacc.std.x           : num  
		 $ tbodyacc.std.y           : num 
 		 $ tbodyacc.std.z           : num  
		 $ tgravityacc.mean.x       : num   
		 $ tgravityacc.mean.y       : num  
		 $ tgravityacc.mean.z       : num   
		 $ tgravityacc.std.x        : num  
		 $ tgravityacc.std.y        : num  
		 $ tgravityacc.std.z        : num  
		 $ tbodyaccjerk.mean.x      : num  
		 $ tbodyaccjerk.mean.y      : num 
 		 $ tbodyaccjerk.mean.z      : num  
		 $ tbodyaccjerk.std.x       : num  
		 $ tbodyaccjerk.std.y       : num  
		 $ tbodyaccjerk.std.z       : num  
		 $ tbodygyro.mean.x         : num  
		 $ tbodygyro.mean.y         : num  
		 $ tbodygyro.mean.z         : num  
		 $ tbodygyro.std.x          : num  
		 $ tbodygyro.std.y          : num  
		 $ tbodygyro.std.z          : num  	 
		 $ tbodygyrojerk.mean.x     : num  
		 $ tbodygyrojerk.mean.y     : num  
		 $ tbodygyrojerk.mean.z     : num  
		 $ tbodygyrojerk.std.x      : num  
		 $ tbodygyrojerk.std.y      : num  
		 $ tbodygyrojerk.std.z      : num  
		 $ tbodyaccmag.mean         : num  
		 $ tbodyaccmag.std          : num  
		 $ tgravityaccmag.mean      : num  
		 $ tgravityaccmag.std       : num  
		 $ tbodyaccjerkmag.mean     : num  
 		 $ tbodyaccjerkmag.std      : num  
 		 $ tbodygyromag.mean        : num  
		 $ tbodygyromag.std         : num  
		 $ tbodygyrojerkmag.mean    : num  
		 $ tbodygyrojerkmag.std     : num  
		 $ fbodyacc.mean.x          : num   
		 $ fbodyacc.mean.y          : num  
		 $ fbodyacc.mean.z          : num  
		 $ fbodyacc.std.x           : num  
		 $ fbodyacc.std.y           : num  
		 $ fbodyacc.std.z           : num  
		 $ fbodyaccjerk.mean.x      : num  
		 $ fbodyaccjerk.mean.y      : num  
		 $ fbodyaccjerk.mean.z      : num  
		 $ fbodyaccjerk.std.x       : num  
		 $ fbodyaccjerk.std.y       : num  
 		 $ fbodyaccjerk.std.z       : num  
		 $ fbodygyro.mean.x         : num  
		 $ fbodygyro.mean.y         : num  
		 $ fbodygyro.mean.z         : num  
		 $ fbodygyro.std.x          : num  
		 $ fbodygyro.std.y          : num  
		 $ fbodygyro.std.z          : num  
		 $ fbodyaccmag.mean         : num  
		 $ fbodyaccmag.std          : num  
		 $ fbodybodyaccjerkmag.mean : num  
		 $ fbodybodyaccjerkmag.std  : num  
		 $ fbodybodygyromag.mean    : num  
		 $ fbodybodygyromag.std     : num  
		 $ fbodybodygyrojerkmag.mean: num  
		 $ fbodybodygyrojerkmag.std : num  
 
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
### Study Design Summary
 
 * How to collect the data
 
   This is a course project. The location of this original raw data set for this course project 
   is provided via the link (see the section of Data Resources in README.md)
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
   
   
 * The purposes/goal of this study design
 
   The first priority of this study design is fulfiled  all the purposes and requirements
   of this project (see the sections of "Purpose and Goal" and "Instructions and Requirements")
   in README.md.
 
---------------------------------------------------------------------------------------

#### Obtain the raw data sets and put them in the working directory (via Rstudio)

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

        
#### Create a tidy data via a R script called run_analysis.R
      
 *Preparation:  data sets and script
     + The data sets and run_analysis.R must be in same the working directory.
           (It is based on one of the requirements this project: The code should have 
            a file run_analysis.R in the main directory that can be run as long as the Samsung
            data is in your working directory. 
            (see "Instructions and Requirements" section in README.md)
      
     + The input raw data for the run_analys.R are:
        
            ./train/X_train.txt, ./train/y_train.txt, subject_train.txt;
            ./test/X_test.txt, ./test/y_test.txt,  subjecct_test.txt;
            ./activity_labels.txt, ./features.txt
        
     + The output tidy data created from run_analysis.R are:
            ./tidy_average_data.txt (180 rows)
            ./combinedcleaningdata.txt (optional)
        
 *How the script run_analysis.R works via Rstudio
     + usage:
     
      		     > source("run_analysis.R") ## load the script
      		     > run_analysis() ##run the script
       
     + There are 5 main steps in run_analysis.R to process the raw data sets and create the tidy data set.
#1. **Load necessary libraries:** The `dplyr` package is loaded. This package provides functions for data manipulation, such as filtering rows, selecting columns, and summarizing data.

#2. **Define the file URL and filename:** The URL of the zip file containing the dataset and the filename to save it as are defined.

#3. **Download the file:** The zip file is downloaded from the URL and saved to the local machine with the specified filename. The file is only downloaded if it doesn't already exist on the local machine.

#4. **Unzip the file:** The zip file is unzipped to extract the dataset. The file is only unzipped if the folder containing the unzipped dataset doesn't already exist.

#5. **Read the activity labels and features:** The activity labels (which map the class labels to the actual activity names) and the features (which describe the measurements taken) are read from their respective text files into data frames.

#6. **Read the training data:** The subject IDs, feature vectors, and class labels for the training data are read from their respective text files into data frames. The column names for the feature vectors are set to the feature names read in the previous step.

#7. **Read the test data:** The subject IDs, feature vectors, and class labels for the test data are read from their respective text files into data frames. The column names for the feature vectors are set to the feature names read earlier.

#8. **Merge the training and test datasets:** The training and test datasets for the subject IDs, feature vectors, and class labels are merged into single data frames using the `rbind()` function.

#9. **Combine the subject, activity, and measurements data:** The subject IDs, class labels, and feature vectors are combined into a single data frame using the `cbind()` function.

#10. **Extract only the measurements on the mean and standard deviation for each measurement:** The columns of the data frame that contain the mean and standard deviation measurements are selected. This is done by finding the feature names that contain "-mean()" or "-std()" and selecting the corresponding columns from the data frame.

#11. **Use descriptive activity names to name the activities in the data set:** The class labels in the data frame are replaced with the actual activity names using the activity labels read earlier.

#12. **Appropriately label the data set with descriptive variable names:** The column names of the data frame are cleaned up to be more descriptive and human-readable. This is done using the `gsub()` function to replace abbreviations and remove unwanted characters.

#13. **Create a second, independent tidy data set with the average of each variable for each activity and each subject:** A second data set is created by grouping the data by subject and activity, and then calculating the mean of each variable for each group. The result is a tidy data set where each row represents a subject-activity pair and each column represents a variable.


-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
#### R code: run_analysis.R

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

	###### End of R script ##################################################################
	#########################################################################################


=============================================================================================================







