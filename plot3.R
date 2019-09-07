#setwd("C:/Users/jiash/Dropbox/R-repo/ExData_Plotting1/")
power <- read.delim("household_power_consumption.txt", 
                    header = TRUE, 
                    sep = ";", 
                    na.string = "?",
                    colClasses = c(NA, NA, "numeric","numeric","numeric","numeric","numeric","numeric"))

power$newDate <- as.Date(power$Date, format = "%d/%m/%Y")
power$dateTime <- paste(power$newDate, power$Time, sep = " ")
power$newDateTime <- strptime(power$dateTime, format = "%Y-%m-%d %H:%M:%S")
power_sub <- power[power$newDate == "2007-02-01" | power$newDate == "2007-02-02",]


#Plot 2
png("plot3.png", width=480, height=480)
par(mfrow=c(1,1))
with(power_sub, plot(newDateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub meeting", col = "black"))
with(power_sub, lines(newDateTime, Sub_metering_2, type = "l", col = "red"))
with(power_sub, lines(newDateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", "legend" = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1:1)

dev.off()
