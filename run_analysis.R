# Getting and Cleaning Data Week4 Project
#
#

# Initializing working space.
rm(list = ls())

# Library used at step 5.
library(plyr)

# Downloading zip file if necessary.
urlZipFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "getdata_projectfiles_UCI HAR Dataset.zip"
rootDirectory <- "UCI HAR Dataset"

if (!file.exists(zipFile)) {
  download.file(urlZipFile, zipFile, method = "curl")
}

if (!file.exists(rootDirectory)) {
  unzip(zipFile)
}

# Filenames definitions.
filepath_Features       <- file.path(rootDirectory, "features.txt")
filepath_ActivityLabels <- file.path(rootDirectory, "activity_labels.txt")

filepath_XTrain         <- file.path(rootDirectory, "train", "X_train.txt")
filepath_yTrain         <- file.path(rootDirectory, "train", "y_train.txt")
filepath_SubjectTrain   <- file.path(rootDirectory, "train", "subject_train.txt")
filepath_XTest          <- file.path(rootDirectory, "test", "X_test.txt")
filepath_yTest          <- file.path(rootDirectory, "test", "y_test.txt")
filepath_SubjectTest    <- file.path(rootDirectory, "test", "subject_test.txt")

# Loading features table.
features <- read.table(filepath_Features)

# Loading activities table.
activities <- read.table(filepath_ActivityLabels)

# Loading training Data Sets.
trainSet_X <- read.table(filepath_XTrain)
trainSet_y <- read.table(filepath_yTrain)
trainSet_Subject <- read.table(filepath_SubjectTrain)

# Loading test Data Sets.
testSet_X <- read.table(filepath_XTest)
testSet_y <- read.table(filepath_yTest)
testSet_Subject <- read.table(filepath_SubjectTest)

# Naming columns.
colnames(activities) <- c("IdActivity", "LabelActivity")

colnames(trainSet_Subject) <- c("IdSubject")
colnames(testSet_Subject) <- c("IdSubject")

colnames(trainSet_X) <- features[, 2]
colnames(testSet_X) <- features[, 2]

colnames(trainSet_y) <- c("IdActivity")
colnames(testSet_y) <- c("IdActivity")

# Merging training and test Data Sets.
trainSet <- cbind(trainSet_y, trainSet_Subject, trainSet_X)
testSet <- cbind(testSet_y, testSet_Subject, testSet_X)
globalSet <- rbind(trainSet, testSet)

# Selecting IdActivity, IdSubject, mean() and std() columns.
featuresMeanOrStd <- grep("IdActivity|IdSubject|-(mean|std)\\(\\)", colnames(globalSet))

globalSet <- globalSet[, featuresMeanOrStd]

# Updating content and label of activity column.
globalSet[, 1] <- activities[globalSet[, 1], 2]
setnames(globalSet, "IdActivity", "LabelActivity")

# Updating columns names with descriptive names.
newColnames <- colnames(globalSet)

for(currentCol in 1:length(newColnames)) {
  # Characters "-", "(" and ")" removed.
  newColnames[currentCol] <- gsub("[-()]", "", newColnames[currentCol])
  # "mean" replaced by "Mean"
  newColnames[currentCol] <- gsub("mean", "_Mean", newColnames[currentCol])
  # "std" replaced by "StdDev".
  newColnames[currentCol] <- gsub("std", "_StdDev", newColnames[currentCol])
  # "Mag" replaced by "Magnitude".
  newColnames[currentCol] <- gsub("Mag", "Magnitude", newColnames[currentCol])
  # "t" variable prefix replaced by "Time".
  newColnames[currentCol] <- gsub("^t", "Time", newColnames[currentCol])
  # "f" variable prefix replaced by "Freq".
  newColnames[currentCol] <- gsub("^f", "Freq", newColnames[currentCol])
  # "BodyBody" replaced by "Body".
  newColnames[currentCol] <- gsub("BodyBody", "Body", newColnames[currentCol])
}

colnames(globalSet) <- newColnames

# Creating and storing tidy Data Set.
tidySet <- ddply(globalSet, .(LabelActivity, IdSubject), function(x) {colMeans(x[, 3:68])})
write.table(tidySet, "./tidySet.txt", row.name=FALSE)
