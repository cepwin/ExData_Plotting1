Plot2<-function() {
  tab1<-read.table(file="household_power_consumption.txt",header = TRUE,na.strings="?",sep=";")
  tab1$DateTime<-with(tab1,paste0(Date," ",Time))
  tab1$DateTime<-strptime(tab1$DateTime,format="%d/%m/%Y %H:%M:%S")
  tab2<-subset(tab1,DateTime>="2007-02-01" & DateTime<"2007-02-03")
  par(mfrow=c(1,1))
  plot(y=tab2$Global_active_power,x=tab2$DateTime,ylab="Global Active Power (kilowatts)",type = "l")
  tab2
}
