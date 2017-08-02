# plot4.R

# Read csv data

data <- read.csv(file = "household_power_consumption.txt" , header = TRUE , sep = ";" ,  stringsAsFactors=FALSE )

# Get data for 2 days only
subdata <- subset(data,Date=="1/2/2007" | Date =="2/2/2007")

# Prepare variables

datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
active_power <- as.numeric(subdata$Global_active_power)
reactive_power <- as.numeric(subdata$Global_reactive_power)
voltage <- as.numeric(subdata$Voltage)
subMetering1 <- as.numeric(subdata$Sub_metering_1)
subMetering2 <- as.numeric(subdata$Sub_metering_2)
subMetering3 <- as.numeric(subdata$Sub_metering_3)


#Setup Device PNG
png("plot4.png", width=480, height=480)

## Setup rows and columns for draw
par(mfrow = c(2, 2)) 

## Draw 1st Graph
plot(datetime, active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

## Draw 2nd Graph
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

## Draw 3rd Graph
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

## Draw 4th Graph
plot(datetime, reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")



#Close device to Draw
dev.off()