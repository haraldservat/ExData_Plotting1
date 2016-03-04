data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", colClasses =  c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = c("?"))

data_filtered <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

data_filtered$date_time = as.POSIXlt(paste(data_filtered$Date,data_filtered$Time ,sep=" "), format="%d/%m/%Y %H:%M:%S")

png("plot2.png")
plot (y = data_filtered$Global_active_power, x = data_filtered$date_time, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()
