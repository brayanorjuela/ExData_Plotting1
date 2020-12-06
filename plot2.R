# Installing packagesneeded to do the reading and filtering
install.packages("readr")
install.packages("dplyr")
# Loading
library("readr")
library("dplyr")
# Actual reading - Assuming that the file to be read is located in the current working directory
Data_Set <- read.csv2("C:/Users/Brayan/Desktop/household_power_consumption.txt")
Data_Set$Date <- as.Date(Data_Set$Date, "%d/%m/%y")
Data_Set <- filter(Data_Set, Date == "2007-02-01", Date == "2007-02-02")
# Creating the data points of one of the plot axes
Global_active_power <- Data_Set$Global_active_power
Global_active_power <- as.numeric(Global_active_power)
# Creating the data points of one of the plot axes
date_axis <- paste(Data_Set$Date, Data_Set$Time) 
date_axis <- strptime(date_axis, "%Y/%m/%d %H:%M:%S")
# Plotting
png("plot2.png", width=480, height=480)
plot(date_axis, Globalactivepower, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")
dev.off()
