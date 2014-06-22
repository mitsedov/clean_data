##Code Book for run_analysis.R
==================================================================
### The initial data

The initial «dirty» dataset provided by Samsung was a result of experiments 
carried out with a group of 30 volunteers, wearing a smartphone. The initial
data contained a number of variables(acceleration, angular velocity etc) 
obtained from the embedded accelerometer and gyroscope. Each observation 
was linked to a subject and activity. The information was spread into 
several files.

===================================================================
### The resulting data

The resulting dataset contains the averages of each variable on mean or standard
deviation (say, X-acceleration in initial dataset) for each activity and each 
subject. All information is in the single file result.txt.

===================================================================
### Variables

Each variable clearly corresponds to the variable in initial dataset described in 
features.txt and features_info.txt. However, only variables on mean and standard 
deviation were extracted and averaged over combinations of subject and activity factors.

===================================================================
### Transformations

Full info on transformations can be found in README.md and code comments

The initial data was merged to a single dataset.
The variables were appropriately descriptively labeled.
Only the variables corresponding to mean or standard deviations were left.
The variables left are averaged over subject and activity.
The resulting dataset’s variables are renamed and the data is saved in results.txt
