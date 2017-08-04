---
title: "Getting and Cleaning Data Course Project"
output: html_document
---
<br>

### Basic Information
<hr>
Document: README.md<br>
Author: Haley Speed<br>
github repository: https://github.com/haleygeek/getting_and_cleaning_data/


### Overview
<hr>
The purpose is to demonstrate my ability to collect, work with, and clean a data set and the 
overarching goal is to prepare tidy data that can be used for later analysis.

The requirements for the "run_analysis.R" script have each been met:

1. Merge the training and the test sets to create one data set
2. Extract only the measurements on the mean and standard deviation for each measurement
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names
5. From the data set in step 4, create a second, independent tidy data set 
with the average of each variable for each activity and each subject.


### Review Criteria
<hr>
1. The submitted data set is tidy  
     * Each variable has its own column. 
     * Each observation has its own row.
     * Each value has its own cell.
     * Column headers are variable names, not values.
     * Single types of observational units are stored in one table.
     * All observational units are stored within a single table.
     * Training and Test datasets are linked by the "subject" column.
     
2. The Github repo contains the required scripts.
     * 'run_analysis.R' is the only script for this project. 
     * All functions are included in this main script.

3. GitHub contains a code book that modifies and updates the available codebooks 
     * 'CodeBook.md' is the codebook for this project
     * Codebook contains updated description of:
     ** Variables
     ** Caluclated summaries 
     ** Data
     ** Transformations and Cleaning Steps
     
4. The README that explains the analysis file is clear and understandable.
    * 'README.md' is the README file for this project
    * Updated from the original data source 'README.txt' file
    * Explains the 'run_analysis.R' file in clear and understandable way
    
5. The work submitted for this project is the work of the student who submitted it.
    * All planning, coding, testing, troubleshooting, and documentation was performed by Haley Speed without additional input or assistance
    
### DATA SOURCES
<hr>
This project is based on, and uses datasets provided by, the Human Activity 
Recognition Using Smartphones Dataset, Version 1.0 by:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

Full description of the original project can be found at: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Original data set can be found at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


### DATA COLLECTION
<hr>
The total sample size is 30 volunteers within an age bracket of 19-48 years. 

The obtained dataset was randomly partitioned into two sets: 

* Training set (ID): 1,3,5,6,7,8,11,14,15,17,19,21,22,23,25,26,27,28,29,30 (70%) 
* Testing set (ID): 2,4,9,10,12,13,18,20,24 (30%)

Each subject performed 6 activities while wearing a Samsung Galaxy S II smartphone on the waist:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING 
        
Measurements were taken from smartphone's embedded accelerometer and gyroscope at a constant rate of 50Hz:

* 3-axial linear acceleration
* 3-axial angular velocity  

The experiments were video-recorded to label the data manually. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 

The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

### DATA PER RECORD
<hr>
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.


### ADDITIONAL SOURCE FILES FROM ORIGINAL DATA 
<hr>

* 'README.txt'
* 'features_info.txt'	Shows information about the variables used on the feature vector.
* 'features.txt' 		List of all features.
* 'activity_labels.txt' Links the class labels with their activity name.
* 'train/X_train.txt' 	Training set.
* 'train/y_train.txt' 	Training labels.
* 'test/X_test.txt' 	Test set.
* 'test/y_test.txt' 	Test labels.
* 'subject_train.txt' 	Each row identifies the subject who performed the activity for 
						each window sample. Its range is from 1 to 30. 
*  Additional inertial signals were included with the original data but were not used in 
	the development, testing, or execution of the run_analysis.R script

	
### LICENSING
<hr>
Use of the original dataset in publications must be acknowledged by referencing the 
following publication:

	-	Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. 
		Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass 
		Hardware-Friendly Support Vector Machine. International Workshop of Ambient 
		Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

	-	This dataset is distributed AS-IS and no responsibility implied or explicit can be 
		addressed to the authors or their institutions for its use or misuse. 
	-	Any commercial use is prohibited.
	-	Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
