data <- read.table("household_power_consumption.txt" , sep = ";", header = TRUE, na.strings = "?")

data[,1] <- as.Date(data[,1], format = "%d/%m/%Y")
data <- data[which(data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")),]

data[,1] <- paste(data[,1], data[,2])
data[,1] <- as.POSIXct(data[,1])
#plots

plot.new()
#setting mfrow par
par(mfrow = c(2,2), mar = c(4,4,2,1))

#first plot
plot(data$Date, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")


#second plot
plot(data$Date, data$Voltage, 
     ylab = "Voltage", xlab = "datetime",
     type = "l")

#third plot

plot(data$Date, data$Sub_metering_1, type = "n", ylab = "Energy Sub Metering", xlab = "")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)

points(data$Date, data$Sub_metering_1, col = "black", type = "l")


points(data$Date, data$Sub_metering_2, col = "red", type = "l")


points(data$Date, data$Sub_metering_3, col = "blue", type = "l")

#fourth plot

plot(data$Date, data$Global_reactive_power, 
     ylab = "Global_reactive_power",
     xlab = "datetime",
     type = "l")

dev.copy(png, file= "plot4.png", width = 480, height = 480)
dev.off()
