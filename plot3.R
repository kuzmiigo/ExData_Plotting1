power.data <- read.csv("household_power_consumption.txt",
                       sep = ";",
                       na.strings = "?",
                       colClasses = c("character", "character", "numeric",
                                      "numeric", "numeric", "numeric",
                                      "numeric",  "numeric", "numeric"))
power.data$Date <- as.Date(power.data$Date, "%d/%m/%Y")
power.data <- subset(power.data,
                     Date == as.Date("2007-02-01") |
                         Date == as.Date("2007-02-02"))
power.data$Datetime <- as.POSIXct(paste(power.data$Date, power.data$Time),
                                  format="%Y-%m-%d %H:%M:%S")
png("plot3.png")
plot(power.data$Datetime, power.data$Sub_metering_1, type = "n", xlab = "",
     ylab = "Energy sub metering")
lines(power.data$Datetime, power.data$Sub_metering_1, col = "black")
lines(power.data$Datetime, power.data$Sub_metering_2, col = "red")
lines(power.data$Datetime, power.data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
