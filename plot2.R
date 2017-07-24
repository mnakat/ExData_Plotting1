# plot2.R

# download the zip file from the URL below
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# extract the zip file and move household_power_consumption.txt to your working directory

library(tidyr)
library(lubridate)

# read power consumption data from csv
power_consumption <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
# use data from the dates 2007-02-01 and 2007-02-02
power_consumption_sub <- subset(power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

# unite Date and Time columns
power_consumption_sub2 <- unite(power_consumption_sub, col=DateTime, sep = " ", value=Date, Time)
# convert the column type to date
power_consumption_sub2$DateTime <- dmy_hms(power_consumption_sub2$DateTime)

# draw graph
with(power_consumption_sub2, plot(DateTime, Global_active_power, type="l", 
                                  xlab="", ylab="Global Active Power (kilowatts)"))
# save the graph as png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
