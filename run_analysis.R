## Project for Getting and Cleaning data
# Load activity_labels and features files
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

activity_labels[,2]<-as.character(activity_labels[,2])
features[,2] <- as.character(features[,2])

#Extracts only the measurements on the mean and standard deviation for each measurement
measures <-grep(".*mean.*|.*std.*",features[,2])
measures_name <- features[measures,2]
measures_name <-gsub("-Mean","Mean",measures_name)
measures_name <-gsub("-std","STD",measures_name)
measures_name <-gsub("[-()]","",measures_name)

# Load the tain and test datasets
train <- read.table("./UCI HAR Dataset/train/X_train.txt")[measures]
train_Activities <- read.table("./UCI HAR Dataset/train/Y_train.txt")
train_Subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainSet <- cbind(train_Subjects, train_Activities, train)

test <- read.table("./UCI HAR Dataset/test/X_test.txt")[measures]
test_Activities <- read.table("./UCI HAR Dataset/test/Y_test.txt")
test_Subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testSet <- cbind(test_Subjects, test_Activities, test)

# Merge datasets into one set and add subject and activity labels
Full_Data <- rbind(trainSet, testSet)
colnames(Full_Data) <- c("subject", "activity", measures_name)

# Classify data and turn subject and activity into factors
Full_Data$activity <- factor(Full_Data$activity, labels = activity_labels[,2])
Full_Data$subject <- as.factor(Full_Data$subject)

library(reshape)
Full_Data <- melt(Full_Data, id = c("subject", "activity"))
Data_Mean <- cast(Full_Data, subject + activity ~ variable, mean)

write.table(Data_Mean, "./tidySet.txt", row.names = FALSE, quote = FALSE)
write.table(measures_name,"./measures_name.txt",row.names = FALSE,quote = FALSE, eol = "\n")