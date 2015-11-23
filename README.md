# Gettingandcleaningdata_assignment
Assignment for Coursera course Getting and Cleaning data

This is the raw dataset that was used: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script uses the data unzipped in the same folder without any changes to the files. 
My R script run_analysis.R has the script matching the 5 steps of the assignment. 
The codebook.md describes the variables, the data, and any transformations or work that was performed to clean up the data. 

**In the end I was finally able to commit my script and codebook to my github repo. Sorry for the inconvenience.**

# Codebook

---
title: "Codebook template"

author: "Gwyneth"

date: "2015, 22 november"
---

Raw data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Description of the raw data:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

About the script:
Run.analysis.R performs data analysis in 5 steps.

1. It reads in all test and training data and merge subject, x and y data using rbind function.

2. It reads the features data and gets from that data the measurements that contain std() or mean() and stores those in desired_features variable. Then using desired_features it makes a subset of x_alldata.

3. It reads the activityLabels data and puts it's labels in place of the values of y_alldata, which gives it descriptive names. 

4. It gives proper naming to the columns of x, y, and subject alldata frames. Furthermore it finally creates 1 dataset of all data using cbind. In the end it writes this dataset into a txt file: tidy_data_set.txt.

5. Creates a tidy data set avg_data with the average of each variable for each activity and each subject. In order to do so we omit the last two columns which were added during the creation of the one dataset, namely 'activity' and 'subjectID'. This dataset is written to a text file avg_data.txt.


Variables:
- x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.

- x_alldata, y_alldata and subject_alldata merge the previous datasets to further analysis.

- features contains the column names for x_alldata 

- desired_features is a a dataset with only the columns with "std()" or "mean()" in it. This is filtered from the features dataset.

- activityLabels contains the description of activities connected to an id. This is the activity lookup. These labels are put in place of the values of y_alldata.

- allData merges x_alldata, y_alldata and subject_alldata into one dataset. 
- avg_data stores the average of each variable for each activity and each subject. This is later stored in a .txt file. 
