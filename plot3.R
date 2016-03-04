data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", colClasses =  c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = c("?"))

data_filtered <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

data_filtered$date_time = as.POSIXlt(paste(data_filtered$Date,data_filtered$Time ,sep=" "), format="%d/%m/%Y %H:%M:%S")

png("plot3.png")

plot (y = data_filtered$Sub_metering_1, x = data_filtered$date_time, type = "n")
plot (y = data_filtered$Sub_metering_1, x = data_filtered$date_time, type = "l", col = "black")
plot (y = data_filtered$Sub_metering_2, x = data_filtered$date_time, type = "l", col = "red")
plot (y = data_filtered$Sub_metering_3, x = data_filtered$date_time, type = "l", col = "blue")

dev.off()

