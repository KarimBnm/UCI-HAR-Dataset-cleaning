
# downloading the data package

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "data.zip", mode ="wb")
unzip("data.zip")

# changing working directory

setwd("~/Getting and Cleaning Data Course Project/UCI HAR Dataset")

## TASK n°1 : Merges the training and the test sets to create one data set.

# read the features labels

features_labels <- read.table("features.txt", col.names = c("Id", "Names"))

# Test set : reading and merging features and output

x_test <- read.table("test/X_test.txt", col.names=features_labels[["Names"]])
y_test <- read.table("test/y_test.txt", col.names="activity")
subject_test <- read.table("test/subject_test.txt", col.names="subject")

merged_test_set <- cbind(x_test, subject_test, y_test)

# Training set : reading and merging features and output

x_training <- read.table("train/X_train.txt", col.names=features_labels[["Names"]])
y_training <- read.table("train/y_train.txt", col.names="activity")
subject_training <- read.table("train/subject_train.txt", col.names="subject")

merged_training_set <- cbind(x_training, subject_training, y_training)

# Merging training and data sets

data_set <- rbind(merged_training_set, merged_test_set)

## TASK n°2 : Extracts only the measurements on the mean and standard deviation for each measurement.

data_set2 <- data_set[, grepl("mean|std|activity|subject", names(data_set)) & !grepl("meanFreq", names(data_set))]
str(data_set2)

## TASK n°3 : Uses descriptive activity names to name the activities in the data set

activity_labels <- read.table("activity_labels.txt", col.names = c("id", "Names"))
data_set2$activity <- sapply(data_set2$activity, function (x) activity_labels[x,"Names"])
head(data_set2$activity)

## TASK n°4 : Appropriately labels the data set with descriptive variable names

labeled_variables <- names(data_set2)

labeled_variables <- gsub("\\(\\)", "", labeled_variables)

labeled_variables <- gsub("Acc", "-acceleration", labeled_variables)

labeled_variables <- gsub("Mag", "-Magnitude", labeled_variables)

labeled_variables <- gsub("^t(.*)$", "\\1-time", labeled_variables)

labeled_variables <- gsub("^f(.*)$", "\\1-frequency", labeled_variables)

labeled_variables <- gsub("(Jerk|Gyro)", "-\\1", labeled_variables)

labeled_variables <- gsub("BodyBody", "Body", labeled_variables)

labeled_variables <- tolower(labeled_variables)

names(data_set2) <- labeled_variables

## Task 5 : From the data set in step 4, creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.

library(tidyr)

tidy_data <- tbl_df(data_set2) %>%
    group_by(subject, activity) %>%
    summarize_each(funs(mean))
    

write.table(tidy_data, file="tidy_data.txt", row.name=FALSE)

