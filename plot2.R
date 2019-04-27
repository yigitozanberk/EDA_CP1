data <- read.table("household_power_consumption.txt" , sep = ";", header = TRUE, na.strings = "?")

data[,1] <- as.Date(data[,1], format = "%d/%m/%Y")
data <- data[which(data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")),]

data[,1] <- paste(data[,1], data[,2])
data[,1] <- as.POSIXct(data[,1])

plot(data$Date, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

dev.copy(png, file= "plot2.png", width = 480, height = 480)
dev.off()