Plot4<-function() {
  ##Read in data
  tab1<-read.table(file="household_power_consumption.txt",header = TRUE,na.strings="?",sep=";")
  ##create date-time column
  tab1$DateTime<-with(tab1,paste0(Date," ",Time))
  tab1$DateTime<-strptime(tab1$DateTime,format="%d/%m/%Y %H:%M:%S")
  ##subset the specified dates
  tab2<-subset(tab1,DateTime>="2007-02-01" & DateTime<"2007-02-03")
  
  ##open graphic device..note the specified size (480x480) is the default
  png(file="Plot4.png")
  
  ##set up plot
  par(mfcol=c(2,2))
  ##item 1
  plot(y=tab2$Global_active_power,x=tab2$DateTime,ylab="Global Active Power",xlab="",type = "l",cex.lab=0.95)
  
  ##item 2
  plot(y=tab2$Sub_metering_1,x=tab2$DateTime,type="l",ylab="Energy sub metering",xlab="",cex.lab=0.95)
  lines(y=tab2$Sub_metering_2,x=tab2$DateTime,col="red")
  lines(y=tab2$Sub_metering_3,x=tab2$DateTime,col="blue")
  legend(x = "topright",legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"), lty=c(1,1,1), cex=0.95, inset=c(0,0), bty="n")
  
  ##item 3
  plot(y=tab2$Voltage,x=tab2$DateTime,type="l",ylab="Voltage",xlab="datetime",cex.lab=0.95, )
  
  ##item 4
  plot(y=tab2$Global_reactive_power,x=tab2$DateTime,type="l",ylab="Global_reactive_power",xlab="datetime",cex.lab=0.95)
  
  ##close the device
  dev.off()
}
