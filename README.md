﻿# GettingAndCleaningData
课程项目

test数据中的原始数据由X_test.txt读入，y_test.txt表示每行数据的测试类型代码，features.txt表示每列的名称；
train数据中的原始数据由X_train.txt读入，y_train.txt表示每行数据的测试类型代码，features.txt表示每列的名称；
activity_labels.txt对应y_test.txt和y_train.txt中各代码的描述性变量

数据的清洗步骤：
读入train数据
整理train数据并标注行列名称
读入test数据
整理test数据并标注行列名称
合并train数据和test数据
按照需求抽取子数据集