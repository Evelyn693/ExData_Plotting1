#reading data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

head(data)

#subset the data
subdata <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
subdata$Time <- strptime(subdata$Time, format="%H:%M:%S")
subdata[1:1440,"Time"] <- format(subdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdata[1441:2880,"Time"] <- format(subdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png("plot4.png")

par(mfrow=c(2,2))

with(subdata,{
  plot(subdata$Time,as.numeric(as.character(subdata$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subdata$Time,as.numeric(as.character(subdata$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subdata$Time,subdata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
   with(subdata,lines(Time,as.numeric(as.character(Sub_metering_1))))
   with(subdata,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
   with(subdata,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
   legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subdata$Time,as.numeric(as.character(subdata$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

dev.off()
