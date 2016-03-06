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

##Plot the line graph
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
line_graph <- plot(datetime, globalActivePower, type="l",xlab=" ",ylab="Global Active Power (kilowats)")
dev.off()
