Plot3<-function() {
  ##Read in data
  tab1<-read.table(file="household_power_consumption.txt",header = TRUE,na.strings="?",sep=";")
  
  ##create date-time column
  tab1$DateTime<-with(tab1,paste0(Date," ",Time))
  tab1$DateTime<-strptime(tab1$DateTime,format="%d/%m/%Y %H:%M:%S")
  
  ##subset the specified dates
  tab2<-subset(tab1,DateTime>="2007-02-01" & DateTime<"2007-02-03")
  
  ##open graphic device..note the specified size (480x480) is the default
  png(file="Plot3.png")
  
  ##set up the plot
  par(mfrow=c(1,1))
  plot(y=tab2$Sub_metering_1,x=tab2$DateTime,type="l",ylab="Energy sub metering",xlab="")
  ##plot the red and blue lines
  lines(y=tab2$Sub_metering_2,x=tab2$DateTime,col="red")
  lines(y=tab2$Sub_metering_3,x=tab2$DateTime,col="blue")
  ##create the legend
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"), lty=c(1,1,1))
  
  ##close the device
  dev.off()
}