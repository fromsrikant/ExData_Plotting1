
## reading the data
activity_url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip";
temp <- tempfile();
download.file(activity_url, temp);
values<-read.table(unz(temp,"household_power_consumption.txt"));
unlink(temp);

##extractinbg the data for feb1 and 2
newvalues<-subset(values,�..Date=="01-02-2007"|�..Date=="02-02-2007");


## checking if data is as per need
head(newvalues);
summary(newvalues);
sapply(newvalues,class);
getOption("max.print");
options(max.print=3000);
library("dplyr");


##setting datatype correctly
newvalues$�..Date<-as.Date(newvalues$�..Date);
newvalues$Time<-as.Date(newvalues$Time);
newvalues$�..Date<- as.Date(newvalues$�..Date, format="%d/%m/%yyyy");
newvalues$Time<-strptime(newvalues$Time,format = "%H:%M:%S");
newvalues$Sub_metering_1<-as.numeric(newvalues$Sub_metering_1);
newvalues$Sub_metering_2<-as.numeric(newvalues$Sub_metering_2);
newvalues$Sub_metering_3<-as.numeric(newvalues$Sub_metering_3);
newvalues$Global_active_power<-as.numeric(newvalues$Global_active_power);
newvalues$Voltage<-as.numeric(newvalues$Voltage);
newvalues$Global_reactive_power<-as.numeric(newvalues$Global_reactive_power);

##plot command
with(newvalues,ts.plot(Global_active_power,gpars=list(ylab="Global Active Power(kilowatts)")));

##saving the file
dev.copy(png,file="plot2.png",width = 480, height = 480,units = "px");
dev.off()









