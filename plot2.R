# plot2.R

# Read csv data

data <- read.csv(file = "household_power_consumption.txt" , header = TRUE , sep = ";" ,  stringsAsFactors=FALSE )

# Get data for 2 days only
subdata <- subset(data,Date=="1/2/2007" | Date =="2/2/2007")

# Prepare variables

datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
active_power <-as.numeric( subdata$Global_active_power )


#Setup Device PNG
png("plot2.png", width=480, height=480)

#Draw Graph
plot(datetime, active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Close device to Draw
dev.off()