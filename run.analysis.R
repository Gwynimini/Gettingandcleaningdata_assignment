library(plyr)

### 1. Merge the training and the test sets to create one data set.

# read test data  
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

# read training data  
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

# merge subject data
subject_alldata <- rbind(subject_test, subject_train)

# merge x data
x_alldata <- rbind(x_test, x_train)

# merge y data
y_alldata <- rbind(y_test, y_train)


### 2. Extract only the measurements on the mean and standard deviation for each measurement. 

# read measurement lookup
features <- read.table("UCI HAR Dataset/features.txt")

# get columns with "std()" or "mean()" in it
desired_features <- grep("-(mean|std)\\(\\)", features[, 2])

# make subset of x data for desired measurements
x_alldata <- x_alldata[, desired_features]


### 3. Use descriptive activity names to name the activities in the data set

# read activity lookup
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")

# put the acitivitylabels in place of the values
y_alldata[, 1] <- activityLabels [y_alldata[, 1], 2]


### 4. Appropriately labels the data set with descriptive variable names. 

# give proper naming to the columns of x, y and subject (all)data frames
names(y_alldata)[names(y_alldata)=="V1"] <- "activity"
names(x_alldata) <- features[desired_features, 2]
names(subject_alldata)[names(subject_alldata)=="V1"] <- "subjectID"

# create 1 dataset of all data
allData <- cbind(x_alldata, y_alldata, subject_alldata)
write.table(allData, "tidy_data_set.txt")

### 5. Create a tidy data set with the average of each variable for each 
# activity and each subject. And exclude last two columns.

avg_data <- ddply(allData, .(subjectID, activity), function(x) colMeans(x[, 1:66]))

write.table(avg_data, "avg_data.txt")
