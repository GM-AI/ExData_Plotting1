#Load library

library(dplyr)
library(data.table)

# Get data 
temp <- tempfile()
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,temp)
unzip(temp)
unlink(temp)

#Load data
data<-tbl_df(read.table(file.path("household_power_consumption.txt"),sep = ";" , header = T ,na.strings ="", stringsAsFactors= F))
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
global_active_power <- as.numeric(data$Global_active_power)

#Activate Graphical Device
png("plot1.png", width=480, height=480)
hist(global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
