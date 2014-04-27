#packages
install.packages("sqldf")
install.packages("stringr")
library(sqldf)
library(stringr)


#setup folder
setwd("C:/MYTABS/EDU")
    if(!file.exists("AD")) {
        dir.create("AD")
    }
setwd("C:/MYTABS/EDU/AD")


#upload the data
fileUrl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
td = tempdir()
tf = tempfile(tmpdir=td, fileext=".zip")
download.file(fileUrl, tf)
flist = unzip(tf, list=TRUE)
a<-nrow(flist)
for (i in 1:a) {
        fname = unzip(tf, list=TRUE)$Name[i]
        unzip(tf, files=fname, exdir=td, overwrite=TRUE)
        fpath = file.path(td, fname)
 	if (!flist$Length[i]==0) {
            tmp<-read.delim(fpath,stringsAsFactor=F,header=F)
            file<-basename(fpath)        
       	#nn<-substr(file[],1,regexpr(".txt",file[])-1)
	#names(tmp) [names(tmp)=="V1"] <- nn[]
		#check first option %in%
		if (regexpr("train.txt",file[]) >0 | regexpr("test.txt",file[]) >0) {
		tmp$V1<-gsub(" ","p",tmp$V1)
		tmp$V1<-gsub("pp","p",tmp$V1)
		tmp <- data.frame(do.call('rbind', strsplit(as.character(tmp$V1),'p',fixed=TRUE)))
		}
	assign(paste(file[],sep=""),tmp)
        }
}

#merge sets
X_test.txt$type<-"test"
X_train.txt$type<-"train"
xset<-rbind(X_test.txt,X_train.txt)
yset<-rbind(y_test.txt,y_train.txt)
dtaset<-cbind(yset,xset)
b<-names(dtaset)
names(dtaset) [names(dtaset)==b[1]] <- "activity"


#assign activity
	names(activity_labels.txt) [names(activity_labels.txt)=="V1"] <- "act"
	activity_labels.txt$id<-substr(activity_labels.txt$act,1,1)
    	dtaset$activity<-as.character(dtaset$activity)
    	actlabels<-activity_labels.txt
    	dtaset<-sqldf("select dtaset.*,actlabels.act from dtaset left outer join actlabels on dtaset.activity=actlabels.id")

#assign volunteers	
dset<-rbind(subject_test.txt,subject_train.txt)   	
q<-names(dset)    	
names(dset) [names(dset)==q[1]] <- "volunteers"    	
dtaset<-cbind(dtaset,dset)    	
dtaset["X1"] <-NULL

#assign labels
l<-nrow(features.txt)
for (i in 1:l) {
	dtaset[,i+1]<-as.numeric(levels(dtaset[,i+1])[dtaset[,i+1]])
	names(dtaset) [names(dtaset)==paste("X",i+1,sep="")] <- features.txt$V1[i]
	}

f1<-features.txt$V1
dtaset<-dtaset[c("type","activity", "act", "volunteers", f1)]

#Extract only the measurements on the mean and standard deviation for each measurement. 
ff<-features.txt
ff$m<-ifelse(regexpr("mean()",ff$V1) >0 | regexpr("std()",ff$V1) >0,1,0)
ff<-ff[ff$m==1,1]
dtaset_mnstdev<-dtaset[c("type","act","volunteers",ff)]

#Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
tt<-dtaset[c("act","volunteers",f1)]
tt$id<-str_c("volunteer",tt$volunteers,tt$act)
ttf<-tt[,c("id",f1)]
s2<-split(ttf,ttf$id)
dtaset_avg<-sapply(s2,function(ttf) colMeans(ttf[,2:562]))

rm(tmp,dset,xset,yset,actlabels,ttf,a,b,f1,ff,file,fname,fpath,i,l,q,s2,td,tf)
cat("ok \n")
cat("1.dtaset - full merged data set \n2.dtaset_mnstdev - data set with the only measurements on the mean and standard deviation for each measurement \n3.dtaset_avg - data set with the average of each variable for each activity and each subject")