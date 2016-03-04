data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", colClasses =  c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = c("?"))

data_filtered <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

data_filtered$date_time = as.POSIXlt(paste(data_filtered$Date,data_filtered$Time ,sep=" "), format="%d/%m/%Y %H:%M:%S")

png("plot4.png")

par(mfrow=c(2,2))

plot (y = data_filtered$Global_active_power, x = data_filtered$date_time, type = "l", ylab = "Global Active Power", xlab="")

plot (y = data_filtered$Voltage, x = data_filtered$date_time, type = "l", ylab = "Voltage", xlab="datetime")

plot (y = data_filtered$Sub_metering_1, x = data_filtered$date_time, type = "n", ylab = "Energy sub metering", xlab = "")
lines (y = data_filtered$Sub_metering_1, x = data_filtered$date_time, col = "black")
lines (y = data_filtered$Sub_metering_2, x = data_filtered$date_time, col = "red")
lines (y = data_filtered$Sub_metering_3, x = data_filtered$date_time, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, box.lwd = 0)

plot (y = data_filtered$Global_reactive_power, x = data_filtered$date_time, type = "l", ylab = "Global_reactive_power", xlab="datetime")

dev.off()
