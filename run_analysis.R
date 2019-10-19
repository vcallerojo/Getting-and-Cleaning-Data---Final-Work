dfvariables<-read.table("C:/Users/Vanessa/Documents/Cursos/Data Science/Cleaning Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt",sep="")
cnames<-make.names(dfvariables[,2],unique=TRUE)
dflabels<-read.table("C:/Users/Vanessa/Documents/Cursos/Data Science/Cleaning Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt",sep="")
##########
dftest1<-read.table("C:/Users/Vanessa/Documents/Cursos/Data Science/Cleaning Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt",sep="")
dfytest1<-read.table("C:/Users/Vanessa/Documents/Cursos/Data Science/Cleaning Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt",sep="")
dfsubtest1<-read.table("C:/Users/Vanessa/Documents/Cursos/Data Science/Cleaning Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt",sep="")
dftest<-cbind(dfsubtest1,dfytest1,dftest1)
colnames(dftest)<-c("subject","activity",cnames)
##########
dftrain1<-read.table("C:/Users/Vanessa/Documents/Cursos/Data Science/Cleaning Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt",sep="")
dfytrain1<-read.table("C:/Users/Vanessa/Documents/Cursos/Data Science/Cleaning Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt",sep="")
dfsubtrain1<-read.table("C:/Users/Vanessa/Documents/Cursos/Data Science/Cleaning Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt",sep="")
dftrain<-cbind(dfsubtrain1,dfytrain1,dftrain1)
colnames(dftrain)<-c("subject","activity",cnames)
##########
dftotal<-rbind(dftest,dftrain)
dftotallabel<-mutate(dftotal,activity=dflabels[activity,2])
dftotalmeanstd<-select(dftotallabel,subject,activity,matches("mean"), matches("std"))
#########
table_grouped<-group_by(dftotallabel,subject,activity)
#########
final_dataset<-summarize_all(table_grouped,mean)
write.table(final_dataset, "C:/Users/Vanessa/Documents/Cursos/Data Science/Cleaning Data/finaldataset.txt",row.names = FALSE)
