## Getting and Cleaning Data - Peer Assessment Project

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

readData: Merges the training and the test sets to create one data set. 
Data set comprises of the X values, Y values and Subject IDs. The path_prefix indicates the path 
where the data files can be found.

run_analysis.R script, functions were created for each step.

readTestData: read test data set, in a folder named "test", and data file names suffixed with "test"

readTrainData: read test data set, in a folder named "train", and data file names suffixed with "train"

mergeData: Merge both train and test data sets

getMergedLabeledData: Combine training and test data sets and add the activity label as another column

getTidyData: Create a tidy data set that has the average of each variable for each activity and each subject

createTidyDataFile: Create the tidy data set and save it on to the named file    
 