==================================================================
Human Activity Recognition Using Smartphones Dataset
==================================================================

The script run_analysis.R needs two packages  installed reshape2 and data.table. 
It produces tidyData.txt in the working directory.

It expects the samsung data to be current working directory with test and train data like this --
./UCI HAR Dataset/train/
./UCI HAR Dataset/test/

Variables 

 subject  - subject id
 activityName  - Activity Names as per "./UCI HAR Dataset/activity_labels.txt"
 f* - feature names as per "./UCI HAR Dataset/features.txt"



Notes: 
======
- Features are normalized and bounded within [-1,1].



For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.