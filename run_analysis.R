# Getting and Cleaning Data - Course Project
# run_analysis.R
# Contains all code used to clean the dataset

# Set to the correct working directory
setwd("./Coursera/Getting and Cleaning Data/Project/")

# Get information regarding features and activities
features <- read.table("./UCI HAR Dataset/features.txt",col.names=c("FeatureID","Feature"))
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",col.names=c("ActivityID","Activity"))

# Load the test data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",col.names="SubjectID")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",col.names=features[,2])
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt",col.names="ActivityID")

# Load the train data
# Satisfies: 4. Appropriately labels the data set with descriptive variable names. (see col.names = ...)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",col.names="SubjectID")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt",col.names=features[,2])
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt",col.names="ActivityID")

# Reduce the X_test/train columns to only those needed:
# Satisfies: 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_features <- grep("mean()",features$Feature,fixed = TRUE)
std_features <- grep("std()",features$Feature,fixed = TRUE)
features_needed <- sort(append(mean_features,std_features)) # sorted to make visual inspection of features_needed easier.  Sort not needed for functionality.
X_test <- X_test[,features_needed]
X_train <- X_train[,features_needed]


# Combine the three data parts:
dat_test <- cbind(subject_test,Y_test,X_test)
dat_train <- cbind(subject_train,Y_train,X_train)

# Combine the test and training data:
# Satisfies: 1. Merges the training and the test sets to create one data set.
dat <- rbind(dat_test,dat_train)

# next get the activity names, then drop the ActivityID:
# Satisfies: 3. Uses descriptive activity names to name the activities in the data set. 
dat_final <- merge(dat,activity_labels,by.x = "ActivityID", by.y = "ActivityID",all = FALSE)
dat_final <- dat_final[,c(2,ncol(dat_final),3:(ncol(dat_final)-1))] # This reorders columns to SubjectID, Activity, [Variables...]

# improve the column names a bit by getting rid of those extra ..:
names(dat_final) <- sub(".mean..", ".mean", names(dat_final))
names(dat_final) <- sub(".std..", ".std", names(dat_final))

# Now get averages for each variable
# Satisfies: 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
dat_averages <- aggregate( . ~ SubjectID + Activity , dat_final , mean ) # Columns: SubjectID, Activity, [Variable Averages...]

# Export the final dataset:
write.table(dat_averages,"dat_averages.txt", row.name=FALSE)



