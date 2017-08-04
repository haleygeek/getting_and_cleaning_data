##  Getting and Cleaning Data Course Project
##  Author: Haley E. Speed, PhD
##  Github repository: https://github.com/haleygeek/getting_and_cleaning_data/
##  See 'README.md' for more detailed overview of the script and adherence to Tidy Data principles
##  See 'CodeBook.md' for detailed information on variables and functions within the script
 

library(dplyr)

## Function Definitions

        # Function to download zip file of original data
        getZipFile <- function () {
                zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
                zipFilename <- "data.zip" 
                if (!file.exists(zipFilename)) { 
                        download.file(zipUrl, zipFilename, method="auto") 
                } else { "The zip file has already been downloaded." }
        }        

        
        # Function to convert original text files to tidy data
        getTidyDataFile <- function (dataFile){      
                
                # Replace space-delimited data with comma-delimited data
                dataFile <- gsub("^\\s+", "", dataFile)
                dataFile <- gsub("\\s\\s", ",", dataFile) 
                dataFile <- gsub("\\s", ",", dataFile)
                
                # convert string of data to a dataframe
                tidyDataFile <- as.data.frame(read.table(textConnection(dataFile), sep = ","))
                return (tidyDataFile)
        }
        
        
        # Function to add subject and activity codes to training and test datasets, then merges the datasets
        mergeDatasets <- function (trainingDataset,testDataset) {
                
                # Assign training and test code books to variables
                trainingActivityCodeBook <- read.delim2("data\\UCI HAR Dataset\\train\\y_train.txt", 
                                                        sep = "\n", quote = "\"", header = FALSE)
                testActivityCodeBook <- read.delim2("data\\UCI HAR Dataset\\test\\y_test.txt", 
                                                    sep = "\n", quote = "\"", header = FALSE)
                trainingSubjectCodeBook <- read.delim2("data\\UCI HAR Dataset\\train\\subject_train.txt", 
                                                       sep = "\n", quote = "\"", header = FALSE)
                testSubjectCodeBook <- read.delim2("data\\UCI HAR Dataset\\test\\subject_test.txt", 
                                                   sep = "\n", quote = "\"", header = FALSE)
               
                 # Add subject and activityCode columns to tidied training and test datasets
                trainingLabeledDataset <- data.frame(cbind(subject = trainingSubjectCodeBook, 
                                                           activityCode = trainingActivityCodeBook, 
                                                           trainingDataset))
                testLabeledDataset <- data.frame(cbind(subject = testSubjectCodeBook, 
                                                       activityCode = testActivityCodeBook, 
                                                       testDataset))
                
                # Assign column names according to the features.txt file
                colnames(trainingLabeledDataset) <-c("subject", "activityCode", 
                                                     gsub("^[0-9]*", "", readLines("data\\UCI HAR Dataset\\features.txt")))
                colnames(testLabeledDataset) <-c("subject", "activityCode", 
                                                 gsub("^[0-9]*", "", readLines("data\\UCI HAR Dataset\\features.txt")))
                
                # Merge training and test datasets
                mergedDataset <- rbind(trainingLabeledDataset, testLabeledDataset)
                
                # Write complete training and test dataframes to files
                write.table(trainingLabeledDataset, file = "trainingDataset.csv", sep=",", col.names = TRUE)
                write.table(testLabeledDataset, file = "testDataset.csv", sep = ",", col.names = TRUE)
                write.table(mergedDataset, file = "mergedDataset.csv", sep=",", col.names = TRUE)
                
                return (mergedDataset)
        }
        
        
        # Function to extract only the measurements on the mean and standard deviation for each measurement
        extractDataset <- function (mergedDataset) {
                extractedDataset <- mergedDataset[grepl("subject", colnames(mergedDataset))|
                                    grepl ("activityCode", colnames(mergedDataset))|
                                    grepl ("\\bmean()\\b", colnames(mergedDataset))| 
                                    grepl ("std()", colnames(mergedDataset))]
                return (extractedDataset)
        }
        
        
        # Function to rename activities in the data set using descriptive activity names
        describeActivity <- function (extractedDataset) {
                labeledDataset <- mutate(extractedDataset, activityName = case_when(
                        extractedDataset$activityCode == 1 ~ "WALKING", 
                        extractedDataset$activityCode == 2 ~ "WALKING_UPSTAIRS",
                        extractedDataset$activityCode == 3 ~ "WALKING_DOWNSTAIRS",
                        extractedDataset$activityCode == 4 ~ "SITTING",
                        extractedDataset$activityCode == 5 ~ "STANDING",
                        extractedDataset$activityCode == 6 ~ "LAYING"))
                
                return (labeledDataset)
        }
        
        
        # Function to appropriately label the data set with descriptive variable names
        renameColumns <- function (descriptiveVariableName) {
                descriptiveVariableName <- gsub(" t", "time", descriptiveVariableName)
                descriptiveVariableName <- gsub(" f", "frequency", descriptiveVariableName)
                descriptiveVariableName <- gsub("Acc", "Accelerometer", descriptiveVariableName)
                descriptiveVariableName <- gsub("Gyro", "Gyroscope", descriptiveVariableName)
                descriptiveVariableName <- gsub("Mag", "Magnitude", descriptiveVariableName)
                descriptiveVariableName <- gsub("mean", "Mean", descriptiveVariableName)
                descriptiveVariableName <- gsub("std", "StandardDeviation", descriptiveVariableName)
                descriptiveVariableName <- gsub("X", "XAxis", descriptiveVariableName)
                descriptiveVariableName <- gsub("Y", "YAxis", descriptiveVariableName)
                descriptiveVariableName <- gsub("Z", "ZAxis", descriptiveVariableName)
                descriptiveVariableName <- gsub("-", "", descriptiveVariableName)
                descriptiveVariableName <- gsub("[()]", "", descriptiveVariableName)
                descriptiveVariableName <- gsub("BodyBody", "Body", fixed = TRUE, descriptiveVariableName)
                return (descriptiveVariableName)
        }

## Getting and Cleaning the Data
        
        ## Download training and test datasets in a zip archive
        getZipFile()
        
        # Read training data and test data text files 
        trainingFile <- readLines("data\\UCI HAR Dataset\\train\\X_train.txt")
        testFile <- readLines("data\\UCI HAR Dataset\\test\\X_test.txt")
        
        # Tidy the original training and test datasets
        trainingDataset <- getTidyDataFile (trainingFile)
        testDataset <- getTidyDataFile (testFile)
        
        
## Requirement 1. Merge the training and the test sets to create one data set.        
        mergedDataset <- mergeDatasets (trainingDataset = trainingDataset, testDataset = testDataset)
        
        
## Requirement 2. Extract only the measurements on the mean and standard deviation for each measurement.
        extractedDataset <- extractDataset(mergedDataset)

        
## Requirement 3. Use descriptive activity names to name the activities in the data set
        descriptiveActivityDataset <- describeActivity (extractedDataset)

        
## Requirement 4. Appropriately label the data set with descriptive variable names.
        renamedColumns <- sapply(colnames(descriptiveActivityDataset), renameColumns)
        colnames(descriptiveActivityDataset) <- renamedColumns

        
## Requirement 5. From the data set in step 4, create a second, independent tidy data set 
## with the averaged dataset of each variable for each activity and each subject.
        averagedDatasets <- aggregate(x = descriptiveActivityDataset[,3:68], 
                        by = list(subject = descriptiveActivityDataset$subject, 
                        activity = descriptiveActivityDataset$activityName), 
                        FUN = function (x) mean(as.numeric(as.character(x))))
        
        
## Write averagedDatasets to file for submission with code
        write.table(averagedDatasets, file = "averageDatasets.txt", row.names = FALSE)
        

        

        



