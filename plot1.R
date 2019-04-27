
data <- read.table("household_power_consumption.txt" , sep = ";", header = TRUE, na.strings = "?")

data[,1] <- as.Date(data[,1], format = "%d/%m/%Y")

data <- data[which(data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")),]

hist(data$Global_active_power, col= "red", main = "Global Active Power", freq = TRUE, xlab = "Global Active Power (kilowatts)", xlim = c(0, 6), ylim = c(0, 1200))

dev.copy(png, file= "plot1.png", width = 480, height = 480)
dev.off()