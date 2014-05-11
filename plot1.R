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
png("plot1.png")
hist(power.data$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
