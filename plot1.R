##Plot1

## reading the data
values <- read.csv("C:/Personal/Coursera/datasciences/exploratory data analysis/household_power_consumption_new.csv");


##extractinbg the data for feb1 and 2
newvalues<-subset(values,ï..Date=="01-02-2007"|ï..Date=="02-02-2007");


## checking if data is as per need
head(newvalues);
summary(newvalues);
sapply(newvalues,class);
getOption("max.print");
options(max.print=3000);
library("dplyr");


##setting datatype correctly
newvalues$ï..Date<-as.Date(newvalues$ï..Date);
newvalues$Time<-as.Date(newvalues$Time);
newvalues$ï..Date<- as.Date(newvalues$ï..Date, format="%d/%m/%yyyy");
newvalues$Time<-strptime(newvalues$Time,format = "%H:%M:%S");
newvalues$Sub_metering_1<-as.numeric(newvalues$Sub_metering_1);
newvalues$Sub_metering_2<-as.numeric(newvalues$Sub_metering_2);
newvalues$Sub_metering_3<-as.numeric(newvalues$Sub_metering_3);
newvalues$Global_active_power<-as.numeric(newvalues$Global_active_power);
newvalues$Voltage<-as.numeric(newvalues$Voltage);
newvalues$Global_reactive_power<-as.numeric(newvalues$Global_reactive_power);


##plot command
with(newvalues,hist(Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)"));

##saving the file
dev.copy(png,file="plot1.png",width = 480, height = 480,
         units = "px");
dev.off()












