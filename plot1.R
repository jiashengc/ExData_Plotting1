#setwd("C:/Users/jiash/Dropbox/R-repo/ExData_Plotting1/")
power <- read.delim("household_power_consumption.txt", 
                    header = TRUE, 
                    sep = ";", 
                    na.string = "?",
                    colClasses = c(NA, NA, "numeric","numeric","numeric","numeric","numeric","numeric"))

power$newDate <- as.Date(power$Date, format = "%d/%m/%Y")
power_sub <- power[power$newDate == "2007-02-01" | power$newDate == "2007-02-02",]

power$Global_active_power

#Plot 1
png("plot1.png", width=480, height=480)
par(mfrow=c(1,1))
hist(power_sub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
