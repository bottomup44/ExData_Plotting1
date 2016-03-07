## read & prepare data 

data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
targetdata <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
datetime <- paste(as.Date(targetdata$Date), targetdata$Time)
targetdata$Datetime <- as.POSIXct(datetime)
targetdata$Global_active_power <- as.numeric(as.character(targetdata$Global_active_power))
targetdata$Global_reactive_power <- as.numeric(as.character(targetdata$Global_reactive_power))
targetdata$Voltage <- as.numeric(as.character(targetdata$Voltage))
targetdata$Sub_metering_1 <- as.numeric(as.character(targetdata$Sub_metering_1))
targetdata$Sub_metering_2 <- as.numeric(as.character(targetdata$Sub_metering_2))
targetdata$Sub_metering_3 <- as.numeric(as.character(targetdata$Sub_metering_3))

## define no of rows and columns

par(mfrow=c(2,2))
        
##PLOT 1

plot(targetdata$Datetime,targetdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")

##PLOT 2

plot(targetdata$Datetime,targetdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
                
##PLOT 3

plot(targetdata$Datetime,targetdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(targetdata$Datetime,targetdata$Sub_metering_2,col="red")
lines(targetdata$Datetime,targetdata$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) 

##PLOT 4

plot(targetdata$Datetime,targetdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
        
##OUTPUT
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()