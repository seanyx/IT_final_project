## this experiment test the RIAA function with GRIP ice core and compare the results with FFT

setwd('/Users/yangxiao/Documents/Dropbox/Research Notes/Irregular_sampling') #office
setwd('/Users/mac/Dropbox/Research Notes/Irregular_sampling') #laptop

source('barcode.r')
source('lomb.r')
source('f_timeseries.r')

#get actual time interval
setwd("/Users/yangxiao/Documents/Dropbox/Research Notes/Methane data/Blunier et al. Byrd, GISP2, GRIP - Greenland and Antarctic Synchronization Data") #office
setwd("/Users/mac/Dropbox/Research Notes/Methane data/Blunier et al. Byrd, GISP2, GRIP - Greenland and Antarctic Synchronization Data") #laptop
#Read in the o18 data
iso_blunier01=read.table("iso_blunier01.txt",header=F,sep="\t",skip=3,fill=T)
isonames=c("depth","d18o","age_grip","depth","d18o","age_gisp2","depth","d18o","age_gisp2","age_grip")
gripiso=iso_blunier01[,1:3]
gripiso=gripiso[complete.cases(gripiso),]
gisp2iso=iso_blunier01[,4:6]
gisp2iso=gisp2iso[complete.cases(gisp2iso),]
byrdiso=iso_blunier01[,7:10]
byrdiso=byrdiso[complete.cases(byrdiso),]
names(gripiso)=isonames[1:3];
names(gisp2iso)=isonames[4:6];
names(byrdiso)=isonames[7:10];

iso=list(gripiso,gisp2iso,byrdiso)

t=iso[[1]]$age_grip/1000
y=iso[[1]]$d18o

#### interpolation
ti=seq(min(t),max(t),by=min(diff(t)))
yi=approx(tm)