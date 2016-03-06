

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

##Histogram graph
colnames(subSetData)
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
histogram <- hist(globalActivePower, col="red",xlab= "Global Active Power (kilowats", main = "Global Active Power", ylim = c(0,1200), ylab= "Frequency")
dev.off()
