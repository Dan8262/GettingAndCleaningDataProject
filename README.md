### Introduction

This repository is dedicated to the Getting and Cleaning Data course project.

### Content of the repository

1. README.md (The file you're currently reading)
2. run_analysis.R (The R script source code)
3. CodeBook.md (The file dedicated to the description of the variables)
4. tidySet.txt (The text file that contains the tidy data set built at step 5 of the project)

### The run_analysis.R script

#### Downloading Data

URL of the page that describes the protocol of the experiments : [Smartphone-Based Recognition of Human Activities and Postural Transitions Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)   
URL of the zip file to be downloaded : [Data Set File](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)   
Name of the downloaded zip file : getdata_projectfiles_UCI HAR Dataset.zip   
Download the zip file and store it your working directory (The program will make it if not already done)    
Unzip the downloade file (The program will make it if not already done)   
A directory "UCI HAR Dataset" is created, it includes the following files:   
* activity_labels.txt (6 lines)
* features.txt (561 lines)
* features_info.txt (59 lines)
* README.txt (70 lines)
* test/Inertial Signals/body_acc_x_test.txt (2947 lines)
* test/Inertial Signals/body_acc_y_test.txt (2947 lines)
* test/Inertial Signals/body_acc_z_test.txt (2947 lines)
* test/Inertial Signals/body_gyro_x_test.txt (2947 lines)
* test/Inertial Signals/body_gyro_y_test.txt (2947 lines)
* test/Inertial Signals/body_gyro_z_test.txt (2947 lines)
* test/Inertial Signals/total_acc_x_test.txt (2947 lines)
* test/Inertial Signals/total_acc_y_test.txt (2947 lines)
* test/Inertial Signals/total_acc_z_test.txt (2947 lines)
* test/subject_test.txt (2947 lines)
* test/X_test.txt (2947 lines)
* test/y_test.txt (2947 lines)
* train/Inertial Signals/body_acc_x_train.txt (7352 lines)
* train/Inertial Signals/body_acc_y_train.txt (7352 lines)
* train/Inertial Signals/body_acc_z_train.txt (7352 lines)
* train/Inertial Signals/body_gyro_x_train.txt (7352 lines)
* train/Inertial Signals/body_gyro_y_train.txt (7352 lines)
* train/Inertial Signals/body_gyro_z_train.txt (7352 lines)
* train/Inertial Signals/total_acc_x_train.txt (7352 lines)
* train/Inertial Signals/total_acc_y_train.txt (7352 lines)
* train/Inertial Signals/total_acc_z_train.txt (7352 lines)
* train/subject_train.txt (7352 lines)
* train/X_train.txt (7352 lines)
* train/y_train.txt (7352 lines)

#### Input Data Files

Only the following files will be used by the program:
1. activity_labels.txt
2. features.txt
3. test/subject_test.txt
4. test/X_test.txt
5. test/y_test.txt
6. train/subject_train.txt
7. train/X_train.txt
8. train/y_train.txt

#### How the script works

If necessary, the script will download the Data Set zip file and unzip it in the working directory.

Step 1: Merges the training and the test sets to create one data set.   
This step merges the content of files `subject_test.txt`, `X_test.txt`, `y_test.txt`, `subject_train.txt`, `X_train.txt` and `y_train.txt` in order to build a global Data Set.

Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.   
Only measurement labels finishing by "-mean()" or "-std()" are selected.

Step 3: Uses descriptive activity names to name the activities in the data set.   
This step is based on the content of the file `activity_labels.txt`

Step 4: Appropriately labels the data set with descriptive variable names.   
This step is based on the content of files `features.txt` and `features_info.txt`.

Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.   
This step uses the function ddply from library "plyr".   
The tidy Data Set is stored in the file `tidySet.txt`.
