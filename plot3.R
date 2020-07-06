#Load library

library(dplyr)
library(data.table)

#Load data
data<-tbl_df(read.table(file.path("household_power_consumption.txt"),sep = ";" , header = T ,na.strings ="", stringsAsFactors= F))
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
global_active_power <- as.numeric(data$Global_active_power)
time_plot <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

sub_metering_1 <- as.numeric(data$Sub_metering_1)
sub_metering_2 <- as.numeric(data$Sub_metering_2)
sub_metering_3 <- as.numeric(data$Sub_metering_3)

#Activate Graphical Device
png("plot3.png", width=480, height=480)
plot(time_plot, sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(time_plot, sub_metering_2, type="l", col="red")
lines(time_plot, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"),lwd=2.5 )
dev.off()
