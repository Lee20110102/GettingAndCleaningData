train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=F)
features <- read.table("./UCI HAR Dataset/features.txt", header=F)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=F)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=F)
colnames(train) <- features[,2] ##使用描述性变量名称恰当标记数据集train
train <- cbind(y_train, train)
names(train)[1] <- "Labels" ##以下使用描述性活动名称命名数据集中的活动
train[c(train[,1]==1),1] <- "WALKING"
train[c(train[,1]==2),1] <- "WALKING_UPSTAIRS"
train[c(train[,1]==3),1] <- "WALKING_DOWNSTAIRS"
train[c(train[,1]==4),1] <- "SITTING"
train[c(train[,1]==5),1] <- "STANDING"
train[c(train[,1]==6),1] <- "LAYING"
test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=F)
features <- read.table("./UCI HAR Dataset/features.txt", header=F)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=F)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=F)
colnames(test) <- features[,2] ##使用描述性变量名称恰当标记数据集test
test <- cbind(y_test, test)
names(test)[1] <- "Labels" ##以下使用描述性活动名称命名数据集中的活动
test[c(test[,1]==1),1] <- "WALKING"
test[c(test[,1]==2),1] <- "WALKING_UPSTAIRS"
test[c(test[,1]==3),1] <- "WALKING_DOWNSTAIRS"
test[c(test[,1]==4),1] <- "SITTING"
test[c(test[,1]==5),1] <- "STANDING"
test[c(test[,1]==6),1] <- "LAYING"
data <- rbind(train, test) ##将test和train数据组合到一起
data2 <- data[,c(grepl("Labels", colnames(data)) | grepl("mean", colnames(data)) | grepl("std()", colnames(data)))]   ##仅提取测量的平均值以及每次测量的标准差
data3 <- data2[,c(grepl("Labels", colnames(data2)) | grepl("mean", colnames(data2)))] ##针对每个活动和每个主题使用每个表里的平均值建立第2个独立的整洁数据集
write.table(data3, "data.txt", row.name=FALSE)