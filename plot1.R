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
# Plotting
png("plot1.png", width=480, height=480)
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
