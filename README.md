Clean Data
==========

The script run_analysis.R performs transformations on the initial Samsung dataset, resulting in a tidy data set, containing the averages of the variables on mean and standard deviation in the initial dataset for each combination of subject and activity.

The full info on transformations is given below.

NOTE: Here I suppose that the working directory contains folders with test and train data

The script run_analysis.R:

1. Reads and merges the data on subject, activity and measurements in test folder
2. Reads and merges the data on subject, activity and measurements in train folder
3. Merges the test and train datasets into «data» dataset
4. Descriptively names the columns according to the information in features.txt
5. Extracts the measurements on mean and standard deviation only (the corresponding
   column names contain «mean» or «std», but not «meanFreq»)
6. Renames the activity factor values according to the activity_labels.txt file, which
   contains more descriptive names
7. Creates a second dataset «d» with the average of each variable for each activity and
   each subject and saves it to the file result.txt