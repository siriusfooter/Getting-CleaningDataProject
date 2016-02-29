# You should create one R script called run_analysis.R that does the following.
# 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# 

# Get the data
    setwd("./GettingAndCleaningData/Week4/data")
    filename <- "./wearables_dataset.zip"
    ## Download and unzip the dataset
    if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
        download.file(fileURL, filename, method="libcurl")
    }  
    if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
    }
    setwd("./UCI HAR Dataset")

# 1. Merge the training and the test sets to create one data set.

    # Read training data
    x_train <- read.table("./train/X_train.txt")
    y_train <- read.table("./train/y_train.txt")
    subject_train <- read.table("./train/subject_train.txt")
    
    # Read testing data
    x_test <- read.table("./test/X_test.txt")
    y_test <- read.table("./test/y_test.txt")
    subject_test <- read.table("./test/subject_test.txt")
    
    # Merge the data
    x_data <- rbind(x_train, x_test)
    y_data <- rbind(y_train, y_test)
    subject_data <- rbind(subject_train, subject_test)

# 2 Extract only the measurements on the mean and standard deviation for each measurement.

    # Load features
    features <- read.table("./features.txt")
    features[,2] <- as.character(features[,2])
    
    # Select required fields 
    reqdFeatures <- grep("-(mean|std)\\(\\)", features[, 2])
    x_data <- x_data[, reqdFeatures]    

    # attach the column names
    names(x_data) <- features[reqdFeatures, 2]

# 3. Use descriptive activity names to name the activities in the data set
    activityLabels <- read.table("./activity_labels.txt")
    activityLabels[,2] <- as.character(activityLabels[,2])
    
    # update values with correct activity names
    y_data[, 1] <- activityLabels[y_data[, 1], 2]
    
    # correct column name
    names(y_data) <- "activity"

# 4. Appropriately label the data set with descriptive variable names
    names(subject_data) <- "subject"
    
    # combine all the data in a single data set
    all_data <- cbind(subject_data, y_data, x_data)
    
# 5. From the data set in step 4, creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject.
    tidy_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 3:68]))
    write.table(tidy_data, "tidy_data.txt", row.name=FALSE)
