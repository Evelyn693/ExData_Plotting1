#reading data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

head(data)

#subset the data
subdata <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

png("plot1.png")

hist(as.numeric(as.character(subdata$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

dev.off()
