# Getting-and-cleaning-data-Assignment

This repository is to submit the assignment for getting and cleaning data course.

## Human Activity Recognition Using Smartphones Dataset

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist and different signals recorded.

## The dataset includes the following files:

- 'README.md'
- 'CodeBook.md': Shows information about the variables used on the feature vector.
- 'tidy_data.txt': Text file containing final tidy data set
- 'run_analysis.R': Gives the R code to download the data and clean it.

## The tidy dataset was generated from the following steps performed on the given dataset.

1. The dataset required for this project was first download from the given url. 

2.The train files were merged into dataframe where
  - The first column of dataset represents subject_id taken from the subject_train file.
  - The second column of dataset represents activity_id taken from y_train file.
  - The third column of dataset represents the signal taken readings from x_train file.

3. The test files were mereged into dataframe in the similar way.

4. Both the test and train datasets were merged into a single dataset and the columns were named respectively.

5. The columns including measurements on the mean and standard deviation(i.e. mean(), std() and freqmean()) were filtered out. The new dataset now consists of the subject_id, activity_id and the new filtered columns.

6. The activity_id column was further replaced by the corresponding activity_name. It was done by matching the activity-id with the activity-name from the activity_labels.txt file which is provided in the downloaded dataset. This dataset is named data_meanstd in the R-code.

7. From the reduced dataset, a second independent dataset was created which consists of the averaged values of each variable for each activity and each subject. It also consists of the columns giving subject-id and activity-name.This dataset is named tidydata2 in the R-code.
