data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", colClasses =  c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = c("?"))

data_filtered <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

data_filtered$date_time = as.POSIXlt(paste(data_filtered$Date,data_filtered$Time ,sep=" "), format="%d/%m/%Y %H:%M:%S")

png("plot1.png")
hist(data_filtered$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red")
dev.off()

