# plot1.R

# download the zip file from the URL below
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# extract the zip file and move household_power_consumption.txt to your working directory

# read power consumption data from csv
power_consumption <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
# use data from the dates 2007-02-01 and 2007-02-02
power_consumption_sub <- subset(power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

# draw graph
hist(power_consumption_sub$Global_active_power, col="red", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

# save the graph as png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
