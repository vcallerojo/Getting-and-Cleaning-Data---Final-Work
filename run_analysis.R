library(dplyr)

#### read features, column names and activity labels
dfvariables<-read.table("./features.txt",sep="")
cnames<-make.names(dfvariables[,2],unique=TRUE)
dflabels<-read.table("./activity_labels.txt",sep="")

#### read test datasets and subjects and organize this data
dftest1<-read.table("./test/X_test.txt",sep="")
dfytest1<-read.table("./test/y_test.txt",sep="")
dfsubtest1<-read.table("./test/subject_test.txt",sep="")
dftest<-cbind(dfsubtest1,dfytest1,dftest1)
colnames(dftest)<-c("subject","activity",cnames)

### read train datasets and subjects and organize this data
dftrain1<-read.table("./train/X_train.txt",sep="")
dfytrain1<-read.table("./train/y_train.txt",sep="")
dfsubtrain1<-read.table("./train/subject_train.txt",sep="")
dftrain<-cbind(dfsubtrain1,dfytrain1,dftrain1)
colnames(dftrain)<-c("subject","activity",cnames)

### bind test and train datasets, replace activity name by label
### and extract parameters related to mean or std
dftotal<-rbind(dftest,dftrain)
dftotallabel<-mutate(dftotal,activity=dflabels[activity,2])
dftotalmeanstd<-select(dftotallabel,subject,activity,matches("mean"), matches("std"))

### group the resulting dataset by subject and activity 
### and get the mean of each value
table_grouped<-group_by(dftotalmeanstd,subject,activity)
final_dataset<-summarize_all(table_grouped,mean)
write.table(final_dataset, "./finaldataset.txt",row.names = FALSE)
