<h2>Getting and Cleaning Data Course Project Code Book</h2>
<h3>The Raw Data Source</h3>
<ul>
<li>The data was collected from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</li>
<li>A full description can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</li></ul>

<h3>Data Set Information</h3>
<p>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. </p>
<p>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. </p>

<h3>The Data</h3>
<p>The dataset includes the following files:</p>
<ul>
<li>'README.txt'</li>
<li>'features_info.txt': Shows information about the variables used on the feature vector.</li>
<li>'features.txt': List of all features.</li>
<li>'activity_labels.txt': Links the class labels with their activity name.</li>
<li>'train/X_train.txt': Training set.</li>
<li>'train/y_train.txt': Training labels.</li>
<li>'test/X_test.txt': Test set.</li>
<li>'test/y_test.txt': Test labels.</li></ul>

<p>The following files are available for the train and test data. Their descriptions are equivalent.</p>
<ul>
<li>'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.</li>
<li>'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.</li>
<li>'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.</li>
<li>'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.</li>
</ul>
<h3>Transformation:</h3>
<p>There are 5 steps that took place to generate a tidy data set:</p>
<ol>
<li>	Merges the training and the test sets to create one data set.</li>
<li>	Extracts only the measurements on the mean and standard deviation for each measurement.</li>
<li>	Uses descriptive activity names to name the activities in the data set.</li>
<li>	Appropriately labels the data set with descriptive activity names.</li>
<li>	Creates a second, independent tidy data set with the average of each variable for each activity and each subject.</li></ol>

<h3>Explanation of how run_analysis.R works to implement the transformation:</h3>
<ul>
<li>Requires reshape2and data.table libraries</li>
<li>	Read all the train and test data</li>
<li>Combine the datasets together using cbind and rbind on the following: subjects, labels, data</li>
<li>	Read the features into a table</li>
<li>Add labels from features into combined data set </li>
<li>Name the variables in the data set from 'features.txt'</li>
<li>	Extract only the measurements on the mean and standard deviation for each measurement. </li>
<li>Read the activity labels into a table</li>
<li>Name the activities in the data set from 'activity_labels.txt'</li>
<li>	Creates a second tidy data set with the average of each variable for each activity and each subject and write to a  new file tidydata.txt</li>
</ul>
