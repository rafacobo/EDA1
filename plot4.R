
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

# Plot4			   
par(mfrow=c(2,2))
# plot 1,1
plot(data$Time, as.numeric(levels(data$Global_active_power))[data$Global_active_power], ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
# plot 1,2
plot(data$Time, as.numeric(levels(data$Voltage))[data$Voltage], ylab = "Voltage", xlab = "datetime", type = "l")
# plot 2,1
plot(data$Time, as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1], ylab = "Energy sub metering", xlab = "", type = "l", ylim = c(0,38))
par(new = TRUE)
plot(data$Time, as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2], ylab = "", xlab = "", type = "l", col = "red", ylim = c(0,38))
par(new = TRUE)
plot(data$Time, data$Sub_metering_3, ylab = "", xlab = "", type = "l", col = "blue", ylim = c(0,38))
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , lty=1, col=c('black', 'red', 'blue'), bty='n', cex=1)
# plot 2,2
plot(data$Time, as.numeric(levels(data$Global_reactive_power))[data$Global_reactive_power], ylab = "Global_reactive_power", xlab = "datetime", type = "l")

# Saving png file
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
# plot 1,1
plot(data$Time, as.numeric(levels(data$Global_active_power))[data$Global_active_power], ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
# plot 1,2
plot(data$Time, as.numeric(levels(data$Voltage))[data$Voltage], ylab = "Voltage", xlab = "datetime", type = "l")
# plot 2,1
plot(data$Time, as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1], ylab = "Energy sub metering", xlab = "", type = "l", ylim = c(0,38))
par(new = TRUE)
plot(data$Time, as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2], ylab = "", xlab = "", type = "l", col = "red", ylim = c(0,38))
par(new = TRUE)
plot(data$Time, data$Sub_metering_3, ylab = "", xlab = "", type = "l", col = "blue", ylim = c(0,38))
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , lty=1, col=c('black', 'red', 'blue'), bty='n', cex=1)
# plot 2,2
plot(data$Time, as.numeric(levels(data$Global_reactive_power))[data$Global_reactive_power], ylab = "Global_reactive_power", xlab = "datetime", type = "l")
dev.off()
