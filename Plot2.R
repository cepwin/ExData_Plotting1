Plot2<-function() {
  ##Read in data
  tab1<-read.table(file="household_power_consumption.txt",header = TRUE,na.strings="?",sep=";")
  
  ##create date-time column
  tab1$DateTime<-with(tab1,paste0(Date," ",Time))
  tab1$DateTime<-strptime(tab1$DateTime,format="%d/%m/%Y %H:%M:%S")
  
  ##subset the specified dates
  tab2<-subset(tab1,DateTime>="2007-02-01" & DateTime<"2007-02-03")
  
  ##open graphic device..note the specified size (480x480) is the default
  png(file="Plot2.png")
  
  ##set up the plot
  par(mfrow=c(1,1))
  plot(y=tab2$Global_active_power,x=tab2$DateTime,ylab="Global Active Power (kilowatts)",xlab="",type = "l")
  
  ##close the device
  dev.off()
}
