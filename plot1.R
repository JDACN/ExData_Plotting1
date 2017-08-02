# plot1.R

# Read csv data

data <- read.csv(file = "household_power_consumption.txt" , header = TRUE , sep = ";" ,  stringsAsFactors=FALSE )

# Get data for 2 days only
subdata <- subset(data,Date=="1/2/2007" | Date =="2/2/2007")

#Setup Device PNG
png("plot1.png", width=480, height=480)

#Draw Graph
hist(as.numeric(subdata$Global_active_power) , main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")


#Close device to Draw
dev.off()