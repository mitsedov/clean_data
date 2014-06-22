## Here I suppose that the working directory contains folders with test and train data
## Read the data on subject, activity and measurments in test folder
subj_test <- read.table("test/subject_test.txt")
act_test <- read.table("test/y_test.txt")
meas_test <- read.table("test/X_test.txt")
## Merge the test data
data_test <- cbind(subj_test, act_test, meas_test)
## Do the same with the train data
subj_train <- read.table("train/subject_train.txt")
act_train <- read.table("train/y_train.txt")
meas_train <- read.table("train/X_train.txt")
data_train <- cbind(subj_train, act_train, meas_train)
## Now merge the test and train data sets
data <- rbind(data_test, data_train)

## Load the needed package
library(plyr)

## Renaming the variables in the data set based on the info in features.txt file
## First read the future column names from features.txt
nam <- read.table("features.txt", sep = " ", colClasses = c("integer", "character"))
## Remove parentheses and replace '-' with '_'
nam[,2] <- gsub("\\()","",nam[,2])
nam[,2] <- gsub("-","_",nam[,2])
## Now rename the columns in the merged data set
## Remember that the first two columns are subject id and activity type
names(data) <- c("subject", "activity", nam[,2])

## Now extract only the measurements on mean and standard deviation
## NOTE: Here I suppose that only columns containing "mean" or "std" are needed,
## but note the ones containing "meanFreq", for example

## Loop over the nam data set to see which rows contain "mean" or "std"
## Find the rows containing "mean" or "std", but not "meanFreq" (regular expressions used)
meanstdrows = c()
for (i in 1:nrow(nam)){
	if ((length(grep("mean",nam[i,2])) > 0) & 
		(length(grep("meanFreq",nam[i,2])) == 0) | 
		(length(grep("std",nam[i,2])) > 0)){
		meanstdrows = c(meanstdrows,i)
	}
}

## Remember that in the dataset "data" from previous opertaions the first two columns are
## subject id and activity type, thus the measurement columns to remain in the data
## should have numbers higher than in the vector meanstdrows by 2
meanstdrows <- meanstdrows + 2

## Now we remove the columns with numbers not in meanstdrows (and thus not containg
## info on means or standard deviations) from the data set "data" 
data <- data[,c(1,2,meanstdrows)]

## Get the mapping between activity names and number in the corresponding column in the dataset
act_lab <- read.table("activity_labels.txt", sep = " ", colClasses = c("integer","character"),col.names = c("lev","lab"))
## Rename the activity factor variable with more descriptive labels
data$activity <- factor(data$activity, levels = act_lab$lev, labels = act_lab$lab)

## Calculate the column means in the data divided by combination of subject and activity factores
d <- ddply(data[,3:ncol(data)],.(data$subject, data$activity), colMeans)

## Rename the first two columns with more succinct labels 
names(d)[1:2] <- c("subject", "activity")

## Rename the columns related to the averages of initial variables
names(d)[3:ncol(d)] <- paste("Average_", names(d)[3:ncol(d)], sep = "")

## Write to file
write.table(d, file = "result.txt", quote = FALSE, row.names=FALSE)






