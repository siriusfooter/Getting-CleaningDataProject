# Getting-CleaningDataProject
This repository has the code for the Coursera project for Getting and cleaning data project. 
 
These are the files in this folder:

R Script called run_analysis.R that looks for 
	R Script does the following:
	- Download the Samsung data from the path below if it does not exist
	- Reads the training and the test data sets from this folder - data in this folder: \data\UCI HAR Dataset
	- Merges them into one data set.
	- Reads the features table and then selects only the measurements with the mean and standard deviation in the field name for each measurement
	- Uses descriptive activity names to name the activities in the data set
	- Appropriately labels the data set with descriptive variable names
	- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject 
	  into a new file called tidy_data.txt

CodeBook.md
The code book summarizes the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.

Data files
The data files are unzipped to this folder:
data\UCI HAR Dataset
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip