##The CookBook

1. All Data were downloaded, unzipped and uploaded into R.
- flist - contains the list of all files
 	Name	Length	Date
1	UCI HAR Dataset/activity_labels.txt	80	2012-10-10 15:55:00
2	UCI HAR Dataset/features.txt	15785	2012-10-11 13:41:00
3	UCI HAR Dataset/features_info.txt	2809	2012-10-15 15:44:00
4	UCI HAR Dataset/README.txt	4453	2012-12-10 10:38:00
5	UCI HAR Dataset/test/	0	2012-11-29 17:01:00
6	UCI HAR Dataset/test/Inertial Signals/	0	2012-11-29 17:01:00
7	UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt	6041350	2012-11-29 15:08:00
8	UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt	6041350	2012-11-29 15:08:00
9	UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt	6041350	2012-11-29 15:08:00
10	UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt	6041350	2012-11-29 15:09:00
11	UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt	6041350	2012-11-29 15:09:00
12	UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt	6041350	2012-11-29 15:09:00
13	UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt	6041350	2012-11-29 15:08:00
14	UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt	6041350	2012-11-29 15:09:00
15	UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt	6041350	2012-11-29 15:09:00
16	UCI HAR Dataset/test/subject_test.txt	7934	2012-11-29 15:09:00
17	UCI HAR Dataset/test/X_test.txt	26458166	2012-11-29 15:25:00
18	UCI HAR Dataset/test/y_test.txt	5894	2012-11-29 15:09:00
19	UCI HAR Dataset/train/	0	2012-11-29 17:01:00
20	UCI HAR Dataset/train/Inertial Signals/	0	2012-11-29 17:01:00
21	UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt	15071600	2012-11-29 15:08:00
22	UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt	15071600	2012-11-29 15:08:00
23	UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt	15071600	2012-11-29 15:08:00
24	UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt	15071600	2012-11-29 15:09:00
25	UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt	15071600	2012-11-29 15:09:00
26	UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt	15071600	2012-11-29 15:09:00
27	UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt	15071600	2012-11-29 15:08:00
28	UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt	15071600	2012-11-29 15:08:00
29	UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt	15071600	2012-11-29 15:08:00
30	UCI HAR Dataset/train/subject_train.txt	20152	2012-11-29 15:09:00
31	UCI HAR Dataset/train/X_train.txt	66006256	2012-11-29 15:25:00
32	UCI HAR Dataset/train/y_train.txt	14704	2012-11-29 15:09:00

2. dtaset merges the training and the test sets into one data set

3. dtaset_mnstdev - data set with the only measurements on the mean and standard deviation for each measurement 

4. dtaset_avg - data set with the average of each variable for each activity and each subject