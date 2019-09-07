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
png("plot2.png", width=480, height=480)
par(mfrow=c(1,1))
with(power_sub, plot(newDateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
