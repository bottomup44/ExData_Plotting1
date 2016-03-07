data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
targetdata <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
targetdata$Global_active_power <- as.numeric(as.character(targetdata$Global_active_power))
hist(targetdata$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()