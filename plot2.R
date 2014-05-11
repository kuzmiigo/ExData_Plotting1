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
png("plot2.png")
plot(power.data$Datetime, power.data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
