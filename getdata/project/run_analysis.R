#project start
library("data.table")
library("reshape2")

#Step1. Merges the training and the test sets to create one data set.

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
setnames(y_train, "V1", "activityNum")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
setnames(subject_train, "V1", "subject")
train_data <- cbind(subject_train, x_train, y_train)

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
setnames(y_test, "V1", "activityNum")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
setnames(subject_test, "V1", "subject")
test_data <- cbind(subject_test, x_test, y_test)
df <- rbind(train_data, test_data)
dt <- data.table(df)

#Step2. Extracts only the measurements on the mean and standard deviation for each measurement. 
dtFeatures <- fread("./UCI HAR Dataset/features.txt")
setnames(dtFeatures, names(dtFeatures), c("featureNum", "featureName"))

dtFeatures <- dtFeatures[grepl("mean\\(\\)|std\\(\\)", featureName)]
dtFeatures$featureCode <- dtFeatures[, paste0("V", featureNum)]
head(dtFeatures)

#Step3. Uses descriptive activity names to name the activities in the data set

dt <- dt[, c("subject", "activityNum", dtFeatures$featureCode), with = FALSE]
setnames(dtActivityNames, names(dtActivityNames), c("activityNum", "activityName"))
setkey(dt, subject, activityNum)
dt <- merge(dt, dtActivityNames, by="activityNum" , all.x = TRUE)

#Step4.Appropriately labels the data set with descriptive variable names. 
#merge featureName
setkey(dt, subject, activityNum, activityName)
dt <- data.table(melt(dt, key(dt), variable.name="featureCode"))
dt <- merge(dt, dtFeatures, by="featureCode", all.x = TRUE)

#Step5.  From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
setkey(dt, subject, activityNum, activityName, featureNum, featureName)
dtTidy1 <- dt[, list(count = .N , average = mean(value)), by=key(dt)]
setkey(dtTidy1, subject, activityName, featureName, count, average)
dtTidy2 <- dtTidy1[, c(key(dtTidy1)), with=FALSE]
head(dtTidy2)
write.table(dtTidy2, "./tidyData.txt", row.name = FALSE)
