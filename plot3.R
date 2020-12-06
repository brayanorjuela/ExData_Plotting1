# Installing packagesneeded to do the reading and filtering
install.packages("readr")
install.packages("dplyr")
# Loading
library("readr")
library("dplyr")
# Actual reading - Assuming that the file to be read is located in the current working directory
Data_Set <- read.csv2("household_power_consumption.txt")
Data_Set$Date <- as.Date(Data_Set$Date, "%d/%m/%y")
Data_Set <- filter(Data_Set, Date == "2007-02-01", Date == "2007-02-02")
# Creating the data points of one of the plot axes
Global_active_power <- Data_Set$Global_active_power
Global_active_power <- as.numeric(Global_active_power)
# Creating the data points of the other plot axis
date_axis <- paste(Data_Set$Date, Data_Set$Time) 
date_axis <- strptime(date_axis, "%Y/%m/%d %H:%M:%S")
# Creating the lines on the graph depending on Submetering
Sub_Metering_1 <- Data_Set$Sub_metering_1 
Sub_Metering_1 <- as.numeric(Sub_metering_1)
Sub_Metering_2 <- Data_Set$Sub_metering_2 
Sub_Metering_2 <- as.numeric(Sub_metering_2)
Sub_Metering_3 <- Data_Set$Sub_metering_3 
Sub_Metering_3 <- as.numeric(Sub_metering_3)
# Plotting
png("plot3.png", width=480, height=480)
plot(date_axis, Sub_Metering_1, type="l", ylab="Energy Submetering", xlab=" ")
lines(date_axis, Sub_Metering_2, type="l", col="red")
lines(date_axis, Sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
dev.off()
