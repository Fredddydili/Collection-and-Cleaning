README
================
Freddy Li
February 25, 2019

### Getting and Cleaning Data - Course Project

------------------------------------------------------------------------

This is the steps for the Getting and Cleaning Data project. The final R script, 'run\_analysis.R', does the following:

-   Load the activity and feature files
-   Load both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
-   Load the activity and subject datasets for taining and testing sets, and merges those columns
-   Merges the two datasets, train and test, into one dataset
-   Converts the 'activity' and 'subject' columns into factors
-   Creates a tidy dataset that consists of the average of each variable for each subject and each activity
-   The end result is shown in the file "tidySet.txt"
