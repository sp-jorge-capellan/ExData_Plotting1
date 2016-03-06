install.packages("data.table")
library(data.table)


#Download the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "household_power_consumption.zip", method = "curl")
unzip("household_power_consumption.zip")


##Read the file in a variable and subset it
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##subset the dataset
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Combination of 4 graphs
colnames(subSetData)
datetime <- strptime(paste(subSetData$Date,subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
global_active_power <- as.numeric(subSetData$Global_active_power)
voltage <- as.numeric(subSetData$Voltage)
Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)
global_reactive_power <- as.numeric(subSetData$Global_reactive_power)

png("plot4.png",width=480,height=480)
par(mfrow = c(2, 2)) 
plot1 <-plot(datetime,global_active_power,type="l",xlab=" ", ylab="Global Active Power")

plot2 <- plot(datetime,voltage, type="l")

plot3 <-plot(datetime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=" ")
lines(datetime,Sub_metering_2,type="l",col="red")
lines(datetime,Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot4 <- plot(datetime, global_reactive_power, type="l")
dev.off()
