
==================================================================================================================
BASIC INFORMATION
==================================================================================================================
Getting and Cleaning Data Course Project
Data Science Specialization
Author: Haley E. Speed, PhD
GitHub Repository: https://github.com/haleygeek/getting_and_cleaning_data/


==================================================================================================================
VARIABLES
==================================================================================================================
activityCodes               Stores the list of activity codes passed to the assembleCompleteDataset function.
dataFile                    Temporary file to store string manipulations in tidying the imported data with the 
                            getTidyDataFile() function.
codedDataset                Dataframe that is returned from assembleCompleteDataset Function and contains tidied 
                            original data plus the subject identifiers and activity codes.
subjectCodes                Stores the list of subject identifiers passed to the assembleCompleteDataset function.
testDataset                 Dataframe constaining the tidied data from the original test data file.
testFile                    Sores the text from the X_test.txt file through multiple cleaning steps.
testLabeledDataset          Complete dataset containing tidied feature data from the test group, subject
                            identifiers, and activity codes.
tidyDataFile                Tidied output of the getTidyDataFile() function.
trainingDataset             Dataframe containing the tidied data from the original training data file.
trainingFile                Stores the text from the X_train.txt file through multiple cleaning steps.
trainingLabeledDataset      Complete dataset containing tidied feature data from the training group, subject
                            identifiers, and activity codes.
zipFilename                 Stores the name of the local file once downloaded from the web.  
                            Note: The default storage location is the root directory of the run_analysis.R script.
zipUrl                      Stores the web address for the zip file containing the original data.

    
==================================================================================================================
FUNCTIONS
==================================================================================================================
assembleCompleteDataset     Appends "subject" and "activityCode" columns to a dataset
getTidyDataFile             Converts new comma-delimitted trainingFile and testFile strings to dataframes
                             
==================================================================================================================           
SUMMARIES CALCULATED
==================================================================================================================

==================================================================================================================
UNITS
==================================================================================================================

==================================================================================================================
DATA
==================================================================================================================
Training subject IDs: # 1,3,5,6,7,8,11,14,15,16,17,19,21,22,23,25,26,27,28,29,30
Test subject IDs: # 2,4,9,10,12,13,18,20,24
testDataset contains 2947 rows and 561 columns (features only)
trainingDataset contains 7352 rows, 561 columns (features only)
testLabeledDataset contains 
trainingLabeledDataset
==================================================================================================================
TRANSFORMATIONS AND CLEANING STEPS
==================================================================================================================
Convert "X_train.txt" and "X_test.txt" files to tidy data
        Values are separated by a single space or double space and the goal is to get the data into clean, 
        comma-separated values that can be read by read.table() with each cell containing the data for only
        one observation from one subject for one variable.
                1. Read training data and test data text files into a strings.
                2. Remove leading whitespace from the original data with gsub() and regular expression "^\\s+".
                3. Convert double spaces to single spaces with gsub() and regular expression "\\s\\s".
                4. Convert single spaces to to commas with gsub() and regular expression "\\s".
                5. Convert to data frame using read.table() with a comma as the separator. Note that because the
                   input data is a string, not a file, we have to use textConnection(dataFile) for read.table()
                   to recognize and read it.
                   
Append subject identifiers and activity codes to the tidied training and test datasets
        I used cbind to append: 
                1. Subject identifiers as column1 to the training and test datasets from the 
                   "subject_train.txt" and "subject_test.txt", respectively.
                2. Activity codes as column2 to the training and test datasets from the 
                   "y_train.txt" and "y_test.txt", respectively.
        I renamed the columns with descriptive names in line with Tidy Data principles. The names of the 561 
        features (measurements) were taken from the "features.txt" file, but had to use gsub() with the regular
        expression "^[0-9]*" to remove the first column of numeric lables from the "features.txt" file.
                     
