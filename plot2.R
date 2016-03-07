data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
targetdata <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
datetime <- paste(as.Date(targetdata$Date), targetdata$Time)
targetdata$Datetime <- as.POSIXct(datetime)
targetdata$Global_active_power <- as.numeric(as.character(targetdata$Global_active_power))
plot(targetdata$Datetime,targetdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
