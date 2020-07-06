#Load library

library(dplyr)
library(data.table)

#Load data
data<-tbl_df(read.table(file.path("household_power_consumption.txt"),sep = ";" , header = T ,na.strings ="", stringsAsFactors= F))
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
global_active_power <- as.numeric(data$Global_active_power)

time_plot <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Activate Graphical Device
png("plot2.png", width=480, height=480)
plot(time_plot, global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
