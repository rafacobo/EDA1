
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

# Plot3			   
plot(data$Time, as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1], ylab = "Energy sub metering", xlab = "", type = "l", ylim = c(0,38))
par(new = TRUE)
plot(data$Time, as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2], ylab = "", xlab = "", type = "l", col = "red", ylim = c(0,38))
par(new = TRUE)
plot(data$Time, data$Sub_metering_3, ylab = "", xlab = "", type = "l", col = "blue", ylim = c(0,38))
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , lty=1, col=c('black', 'red', 'blue'), bty='o', cex=1)
# Saving png file
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(data$Time, as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1], ylab = "Energy sub metering", xlab = "", type = "l", ylim = c(0,38))
par(new = TRUE)
plot(data$Time, as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2], ylab = "", xlab = "", type = "l", col = "red", ylim = c(0,38))
par(new = TRUE)
plot(data$Time, data$Sub_metering_3, ylab = "", xlab = "", type = "l", col = "blue", ylim = c(0,38))
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , lty=1, col=c('black', 'red', 'blue'), bty='o', cex=1)
dev.off()
