# read all the train and test data
test.labels <- read.table("test/y_test.txt", col.names="label")
test.subjects <- read.table("test/subject_test.txt", col.names="subject")
test.data <- read.table("test/X_test.txt")
train.labels <- read.table("train/y_train.txt", col.names="label")
train.subjects <- read.table("train/subject_train.txt", col.names="subject")
train.data <- read.table("train/X_train.txt")

# combine the datasets together in the this order using cbind and rbind: subjects, labels, data
combineddata <- rbind(cbind(test.subjects, test.labels, test.data),
                      cbind(train.subjects, train.labels, train.data))

# read the features into a table
features <- read.table("./features.txt", strip.white=TRUE, stringsAsFactors=FALSE)

##replace column labels in combineddata with labels in features
names(combineddata)<-c("subjects", "labels",features$V2)

##Extracts only the measurements on the mean and standard deviation for each measurement. only keep the columns with mean and std in them 

##use grep which looks for variable labels that contain...
##within the features data table look for variable labels that contain mean OR STD within column VS
meanSTD<-combineddata[grep("mean\\(\\)|std\\(\\)|subjects|labels", names(combineddata))]

##Uses descriptive activity names to name the activities in the data set

# read the activity labels into a table- all rows two columns
activitylabels <- read.table("./activity_labels.txt", stringsAsFactors=FALSE)


meanSTD$labels<-factor(meanSTD$labels, labels=activitylabels$V2)
#meanSTD is now tidy data


#From the data set in step 4, creates a second, independent tidy data 
##with the average of each variable for each activity and each subject.

tidydata <- aggregate(meanSTD[, 3:ncol(meanSTD)],
                      by=list(subjects = meanSTD$subjects, 
                              labels = meanSTD$labels),
                      mean)
write.table(tidydata, file = "./tidydata.txt", row.name=FALSE)
