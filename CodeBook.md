### Introduction

This `CodeBook.md` file is dedicated to the description of variables used by the Getting and Cleaning Data course project.

### Test and Training Data Sets files

activity_labels.txt (6 lines)   
features.txt (561 lines)    
test/subject_test.txt (2947 lines)   
test/X_test.txt (2947 lines)   
test/y_test.txt (2947 lines)   
train/subject_train.txt (7352 lines)   
train/X_train.txt (7352 lines)   
train/y_train.txt (7352 lines)   

Features are the list of the 561 variables that were measured or computed during the experiment.

Features are normalized and bounded within [-1, 1].

The units used for accelerations (total and body) are 'g's (gravity of Earth =>  9.80665 m/s^2.

Gyroscopes measurements are defined in rad/s.

Two main groups of features can be defined:
* "t" (for time) prefixed features are signal that come from the accelerometer and gyroscope 3-axial raw signals; these signals were captured at a constant rate of 50 Hz. 
* "f" (for frequency) prefixed features are the application of a Fast Fourier Transform to some of the "t" signals.

Subjects are a group of 30 volunteers whithin an age bracket of 19-48 years.

Test and Train Set Data Sets are the result of a random partition of experiment data set. 70% of the volunteers was selected for generating the training set and 30% the test set.

### Activity Variables

Activity Id and Labels are stored in the file `activity_labels.txt`; activities describe the different postures of subjects associated with the experiment, it's defined by video-recording each subject.

<table>
  <tr>
    <td>Activity Id</td><td>Activity Label</td>
  </tr>
  <tr>
    <td>1</td><td>WALKING</td>
  </tr>
  <tr>
    <td>2</td><td>WALKING_UPSTAIRS</td>
  </tr>
  <tr>
    <td>3</td><td>WALKING_DOWNSTAIRS</td>
  </tr>
  <tr>
    <td>4</td><td>SITTING</td>
  </tr>
  <tr>
    <td>5</td><td>STANDING</td>
  </tr>
  <tr>
    <td>6</td><td>LAYING</td>
  </tr>
</table>

### Selected Mean and Standard Deviation Variables

All variables associated with labels that included "-mean()" or "-std()" substrings were selected, these two substrings define the two sets of variables associated with Mean value and Standard deviation (cf. `features_info.txt`). That means variables like "fBodyAccJerk-meanFreq()-Y" or "angle(X,gravityMean)" were not selected.

### Renaming Global Set Variables

List of applied modifications to variable labels:
* Characters "-", "(" and ")" have been removed.
* "t" variable prefix has been replaced by "Time".
* "f" variable prefix has been replaced by "Freq".
* "mean" has been replaced by "_Mean".
* "std" has been replaced by "_StdDev".
* "Mag" has been replaced by "Magnitude".
* "BodyBody" has been replaced by "Body"

For instance, "tBodyAcc-mean()-X" becamed "TimeBodyAcc_MeanX" and "fBodyAccMag-mean()" becamed "FreqBodyAccMagnitude_Mean".
