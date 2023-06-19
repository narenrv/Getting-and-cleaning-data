# Getting-and-cleaning-data
Step-by-step explanation of the R script:

1. **Load necessary libraries:** The `dplyr` package is loaded. This package provides functions for data manipulation, such as filtering rows, selecting columns, and summarizing data.

2. **Define the file URL and filename:** The URL of the zip file containing the dataset and the filename to save it as are defined.

3. **Download the file:** The zip file is downloaded from the URL and saved to the local machine with the specified filename. The file is only downloaded if it doesn't already exist on the local machine.

4. **Unzip the file:** The zip file is unzipped to extract the dataset. The file is only unzipped if the folder containing the unzipped dataset doesn't already exist.

5. **Read the activity labels and features:** The activity labels (which map the class labels to the actual activity names) and the features (which describe the measurements taken) are read from their respective text files into data frames.

6. **Read the training data:** The subject IDs, feature vectors, and class labels for the training data are read from their respective text files into data frames. The column names for the feature vectors are set to the feature names read in the previous step.

7. **Read the test data:** The subject IDs, feature vectors, and class labels for the test data are read from their respective text files into data frames. The column names for the feature vectors are set to the feature names read earlier.

8. **Merge the training and test datasets:** The training and test datasets for the subject IDs, feature vectors, and class labels are merged into single data frames using the `rbind()` function.

9. **Combine the subject, activity, and measurements data:** The subject IDs, class labels, and feature vectors are combined into a single data frame using the `cbind()` function.

10. **Extract only the measurements on the mean and standard deviation for each measurement:** The columns of the data frame that contain the mean and standard deviation measurements are selected. This is done by finding the feature names that contain "-mean()" or "-std()" and selecting the corresponding columns from the data frame.

11. **Use descriptive activity names to name the activities in the data set:** The class labels in the data frame are replaced with the actual activity names using the activity labels read earlier.

12. **Appropriately label the data set with descriptive variable names:** The column names of the data frame are cleaned up to be more descriptive and human-readable. This is done using the `gsub()` function to replace abbreviations and remove unwanted characters.

13. **Create a second, independent tidy data set with the average of each variable for each activity and each subject:** A second data set is created by grouping the data by subject and activity, and then calculating the mean of each variable for each group. The result is a tidy data set where each row represents a subject-activity pair and each column represents a variable.
