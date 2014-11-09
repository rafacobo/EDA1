
# Exploratory Data Analysis, Course Project 1

# Getting and Unzipping Data
temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp, mode="wb")
unzip(temp, "household_power_consumption.txt")
dd <- read.table("household_power_consumption.txt", sep=";", header=T)

#  Subsetting
data <- rbind(dd[which(dd$Date == "1/2/2007"),],dd[which(dd$Date == "2/2/2007"),])
rm(dd)
data$Time <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 

# Plot2			    
plot(data$Time, as.numeric(levels(data$Global_active_power))[data$Global_active_power], ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
# Saving png file
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(data$Time, as.numeric(levels(data$Global_active_power))[data$Global_active_power], ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.off()