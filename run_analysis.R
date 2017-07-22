#####This code creates the tidy data set from the given data set for the Assignment####

##### Download the dataset if not already downloaded#####

filename<-"getdata_dataset.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename,mode="wb")
}  
if(!file.exists("UCI HAR Dataset")){ 
  unzip(zipfile=filename, exdir=".") 
}

#### Read the features and the activity file####
read.table("./UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE)->activity
read.table("./UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)->features
dim(activity)
names(activity)<-c("activity_id","activity_name")
dim(features)

####Read the Train Data####
read.table("./UCI HAR Dataset/train/subject_train.txt",stringsAsFactors=FALSE)->subject_train
read.table("./UCI HAR Dataset/train/x_train.txt",stringsAsFactors=FALSE)->x_train
read.table("./UCI HAR Dataset/train/y_train.txt",stringsAsFactors=FALSE)->y_train

####Read the Test Data####
read.table("./UCI HAR Dataset/test/subject_test.txt",stringsAsFactors=FALSE)->subject_test
read.table("./UCI HAR Dataset/test/x_test.txt",stringsAsFactors=FALSE)->x_test
read.table("./UCI HAR Dataset/test/y_test.txt",stringsAsFactors=FALSE)->y_test

##Create Train data set##
data_train<-data.frame(subject_train,y_train,x_train,stringsAsFactors=FALSE)

##Create Test data set##
data_test<-data.frame(subject_test,y_test,x_test,stringsAsFactors=FALSE)

## Merge the Train and the Test data set##
data_all<-rbind(data_train,data_test)

## Name all the columns i.e. descriptive variable names
names(data_all)<-c("subject_id","activity_id",features[,2])

## Extract measurements on Mean and Standard Deviation##
grep("mean|std",names(data_all))->meanstd_colnum
data_meanstd<-data_all[,c(1,2,meanstd_colnum)]

## creating a temporary dataset in order to use descriptive activity names##
temp<-data.frame(data_meanstd[,2],stringsAsFactors=FALSE)
names(temp)<-"activity_id"
temp$activity_name<-activity[match(temp$activity_id,activity$activity_id),2]
data_meanstd[,2]<-temp[,2]
names(data_meanstd)[2]<-"activity_name"

## Data set with average of each variable ##
## for each activity and each subject     ##
aggregate(x=data_meanstd[,-(1:2)],by=data_meanstd[,1:2],FUN="mean")->tidydata2

## generate a text file of the tidy dataset
write.table(tidydata2, "tidy_data.txt", row.name=FALSE)