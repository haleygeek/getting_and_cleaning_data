---
title: "Getting and Cleaning Data Course Project"
output: html_document
---

<br>

### BASIC INFORMATION    
<hr>
<b>Document:</b>   CodeBook.md<br>
<b>Author:</b>   Haley Speed<br>
<b>Github:</b>   https://github.com/haleygeek/getting_and_cleaning_data <br>
<br>

### DATA VARIABLES
<hr>
<b>Variables Inherited from Original Data</b>

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

<pre><code>
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
</code></pre>
<br>

The set of variables that were estimated from these signals are: 
<pre><code>
mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.
</code></pre>
<br>

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
<pre><code>
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
</code></pre>
<br>

The complete list of variables of each feature vector is available in 'features.txt' codebook, which has been included in the https://github.com/haleygeek/getting_and_cleaning_data repository
<br>
<br>
<br>
<b>Variables Appended in 'run_analysis.R'</b>
<pre><code>
subject                    Contains the ID number of the participant from which the observation is made. 
                           Values are imported from the 'subject_train.txt' and 'subject_test.txt' 
                           codebooks.
activityCode               Activity codes imported from the 'y_train.txt' training and test codebooks.
activityName               Descriptive names of 6 activities analyzed in the original data. Values 
                           are imported from the 'activity_labels.txt' codebook.
</code></pre>
<br> 

### R SCRIPT VARIABLES
<hr>
<pre><code>
averagedDatasets           Dataframe containing the average value of each feature (variable) mean and 
                           standard deviation for each activity for each study participant.
dataFile                   Temporary file to store string manipulations in tidying the imported data. 
                           with the getTidyDataFile() function.
descriptiveActivityDataset Dataset containing descriptive activity names for all observations.
descriptiveVariableName    Temporarily stores the name of a column as it progresses through the 
                           descriptive renaming steps in the renameColumns() function.
extractDataset             Dataset containing only the mean() and std() features for all participants. 
labeledDataset             Dataset with a new column with activity names that match the value in the
                           acitivity codes column.
mergedDataset              Complete, tidy dataset compliled from both the training and test datasets
                           and is returned from the mergeDatasets() function.
renamedColumns             A list of descriptive column names for each feature
testActivityCodeBook       Stores activity codes for each observation by each test participant.
testDataset                Dataframe constaining the tidied data from the original test data file.
testFile                   Sores the text from the X_test.txt file through multiple cleaning steps.
testLabeledDataset         Complete dataset containing tidied feature data from the test group, 
                           subject identifiers, and activity codes.
testSubjectCodeBook        Stores subject IDs for each observation from 'y_train' codebook.
tidyDataFile               Tidied output of the getTidyDataFile() function.
trainingActivityCodeBook   Stores activity codes for each observation by each training participant.
trainingDataset            Dataframe containing the tidied data from the original training data file.
trainingFile               Stores the text from the X_train.txt file through multiple cleaning steps.
trainingLabeledDataset     Complete dataset containing tidied feature data from the training group, 
                           subject identifiers, and activity codes.
trainingSubjectCodeBook    Stores subject IDs for each observation from 'y_train' codebook.
zipFilename                Stores the name of the local file once downloaded from the web.Note: 
                           The default storage location is the root directory of the 
                           run_analysis.R script.  
zipUrl                     Stores the web address for the zip file containing the original data.
</code></pre>
<br>    

### FUNCTIONS
<hr>
<pre><code>
describeActivity()        Renames activities in the data set using descriptive activity names.
extractDataset()          Extracts only the measurements on the mean and standard deviation 
                          for each measurement.
getTidyDataFile()         Converts original text files to tidy dataframes by replacing spaces 
                          with commas.
getZipFile()              Checks to see if original data zip file exists. If not, downloads it 
                          from the web.
mergeDatasets()           Adds subject and activity codes to training and test datasets, then
                          merges datasets.
renameColumns()           Appropriately labels the data set with descriptive variable names
</code></pre>
<br>  

### SUMMARIES CALCULATED
<hr>

<b>Averaged dataset of each variable for each activity and each subject. </b> 
<br>
The aggregate() function is used to find the mean of each mean and standard deviation of each feature (measurement) for each subject for each of the 6 activities. The input dataset, 'descriptiveActivityDataset', contains 69 rows. Column 1 contains subject data, Column 2 contains activity codes, Columns 3-68 contain feature data (mean or std of each feature), and Column 69 contains activity names. The aggregate() function is set up so that the mean of each feature mean or feature standard deviation is calculated with regard to the subject ID (Column 1) and width regard to the activity name (Column 69). The resulting dataframe contains 68 columns: Column 1 = subject identifiers, Column 2 = activity names, Columns 3:68 = mean or std feature data. Each row contains the mean of every mean feature measurement for 1 activity.
<br>

### DATA
<hr>
<pre><code>
Activity Codes                # 1,2,3,4,5,6
Acitivity Names               WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
Training subject IDs          # 1,3,5,6,7,8,11,14,15,16,17,19,21,22,23,25,26,27,28,29,30
Test subject IDs              # 2,4,9,10,12,13,18,20,24
testDataset                   Contains 2947 rows and 561 columns (features only)
trainingDataset               Contains 7352 rows, 561 columns (features only)
mergedDataset                 Contains 10299 rows and 563 columns (subject, activity code, features)
descriptiveActivityDataset    Contains 10299 rows and 69 columns (subject, acitivity code and names, 
                              features)
extractedDataset              Contains 10299 rows and 68 columns ("activityCodes" column is not extracted)
averagedData                  Contains 180 rows and 68 columns
</code></pre>
<br>  

### CALCULATIONS AND UNITS OF MEASUREMENT
<hr>
<pre><code>
Total Acceleration      The acceleration signal from the smartphone accelerometer X axis in standard 
                        gravity units 'g'. 
Body Acceleration       The body acceleration signal obtained by subtracting the gravity from the total
                        acceleration. 
Angular Velocity        The angular velocity vector measured by the gyroscope for each window sample. 
                        The units are radians/second. 
</code></pre>
<br>  


### TRANSFORMATIONS AND CLEANING STEPS
<hr>
<b>Convert "X_train.txt" and "X_test.txt" files to tidy data.</b> 
<br>
Values are separated by a single space or double space and the goal is to get the data into clean, comma-separated values that can be read by read.table() with each cell containing the data for only one observation from one subject for one variable.

1. Read training data and test data text files into a strings.
2. Remove leading whitespace from the original data with gsub() and regular expression "^\\s+".
3. Convert double spaces to single spaces with gsub() and regular expression "\\s\\s".
4. Convert single spaces to to commas with gsub() and regular expression "\\s".
5. Convert to data frame using read.table() with a comma as the separator. Note that because the input data is a string, not a file, we have to use textConnection(dataFile) for read.table() to recognize and read it.
                   
<b>Append subject identifiers and activity codes to the tidied training and test datasets.</b> 
<br>
C-binding is used to append: 

1. Subject identifiers as column1 to the training and test datasets from the "subject_train.txt" and "subject_test.txt", respectively.
2. Activity codes as column2 to the training and test datasets from the "y_train.txt" and "y_test.txt", respectively.

<b>Rename columns with descriptive names in line with Tidy Data principles.</b>
<br>
The names of the 561 features (measurements) are taken from the "features.txt" file, but had to use gsub() with the regular expression "^[0-9]*" to remove the first column of numeric lables from the "features.txt" file.
                     
<b>Merge tidied training and test datasets.</b>
<br>
Merge() requires too much memory for two dataframes of this size. Instead, r-binding is chosen for faster, more memory efficient merging since both datasets share the same structure and column names.

<b>Extract only the measurements on the mean and standard deviation. </b>
<br>
grepl() is used to subset the mergedDataset dataset, selecting columns with mean() or std() in their names while also preserving the subject and activity code columns. Boundaries (/b) are used in a regular expression before and after "mean()" to get an exact match so that meanfreq() isn't extractedDataset. Alternatively, I could have used the fixed=TRUE parameter to search for "mean()" with grepl().

<b>Use descriptive activity names to name the activities in the data set.</b>
<br>
A new column is added to contain descriptive labels for activity codes (activityname) using mutate(). The new column is populated from the 'activity_labels.txt' codebook with the "case_when" option for mutate(). 

<b>Appropriately label the extracted dataset with descriptive variable names.</b> 
<br>
Each of the original 562 variables is named according to the abbreviations:  

* t = time
* f = frequency
* Acc = Accelerometer
* -mean() = Mean
* -X = Xaxis
* -Y = Yaxis
* -Z = Zaxis
* grav = Gravity
* Gyro = Gyroscope
* Magnitude
* -StandardDeviation

so that the variable name, "tBodyAcc-mean()-X" could be read as the "mean body acceleration on the X axis in the time domain." The renameColumns() function expands these abbreviations into more descriptive column names. For the above example, the new name would be "timeBodyAccelerationMeanXAxis," where capitalization is used only to denote the first letter of a new desciptive term and to make the longer, descriptive names easier to read.

Two issues that arose during from the renaming process are the presence of the "BodyBody" redundant labels in the 'features.txt' file that are mislabeled compared to the 'features_info.txt' codebook:

* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()

In these cases, "BodyBody" is replaced with "Body"to be consistent with the 'features_info.txt' codebook. The other issue is the removal of parentheses from column names (i.e. "mean()" and "std()"). To do this using the gsub() function, the regular expression "[()]" is used to denote an exact match for a set of parentheses anywhere in the column name.

               
                