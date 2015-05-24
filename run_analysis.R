train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=F)
features <- read.table("./UCI HAR Dataset/features.txt", header=F)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=F)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=F)
colnames(train) <- features[,2] ##ʹ�������Ա�������ǡ��������ݼ�train
train <- cbind(y_train, train)
names(train)[1] <- "Labels" ##����ʹ�������Ի�����������ݼ��еĻ
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
colnames(test) <- features[,2] ##ʹ�������Ա�������ǡ��������ݼ�test
test <- cbind(y_test, test)
names(test)[1] <- "Labels" ##����ʹ�������Ի�����������ݼ��еĻ
test[c(test[,1]==1),1] <- "WALKING"
test[c(test[,1]==2),1] <- "WALKING_UPSTAIRS"
test[c(test[,1]==3),1] <- "WALKING_DOWNSTAIRS"
test[c(test[,1]==4),1] <- "SITTING"
test[c(test[,1]==5),1] <- "STANDING"
test[c(test[,1]==6),1] <- "LAYING"
data <- rbind(train, test) ##��test��train������ϵ�һ��
data2 <- data[,c(grepl("Labels", colnames(data)) | grepl("mean", colnames(data)) | grepl("std()", colnames(data)))]   ##����ȡ������ƽ��ֵ�Լ�ÿ�β����ı�׼��
data3 <- data2[,c(grepl("Labels", colnames(data2)) | grepl("mean", colnames(data2)))] ##���ÿ�����ÿ������ʹ��ÿ�������ƽ��ֵ������2���������������ݼ�
write.table(data3, "data.txt", row.name=FALSE)