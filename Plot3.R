Plot3<-function() {
  tab1<-read.table(file="household_power_consumption.txt",header = TRUE,na.strings="?",sep=";")
  tab1$DateTime<-with(tab1,paste0(Date," ",Time))
  tab1$DateTime<-strptime(tab1$DateTime,format="%d/%m/%Y %H:%M:%S")
  tab2<-subset(tab1,DateTime>="2007-02-01" & DateTime<"2007-02-03")
  par(mfrow=c(1,1))
  plot(y=tab2$Sub_metering_1,x=tab2$DateTime,type="l",ylab="Energy sub metering",xlab="")
  lines(y=tab2$Sub_metering_2,x=tab2$DateTime,col="red")
  lines(y=tab2$Sub_metering_3,x=tab2$DateTime,col="blue")
  legend("topright", legend=c("Submeter 1", "Submeter 2","Submeter 3"),col=c("black","red", "blue"), lty=c(1,1,1))
  dev.copy(png, file = "Plot3.png")
  dev.off()
}