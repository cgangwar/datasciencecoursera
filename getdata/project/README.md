The script run_analysis.R needs two packages  installed reshape2 and data.table. 
It expects the samsung data to be current working directory with test and train data like this --
./UCI HAR Dataset/train/
./UCI HAR Dataset/test/

Variables 

 subject  - subject number 
 activityName  - Activity Names as per "./UCI HAR Dataset/activity_labels.txt"
 featureName - feature names as per "./UCI HAR Dataset/features.txt"
 count    - number of samples
 average - average value