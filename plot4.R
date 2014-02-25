data <- read.table("household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?")
data$datetime <- paste(data$Date,data$Time,sep=" ")
data$datetime <- strptime(as.character(data$datetime),format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
days <- as.Date(c("2007/02/01","2007/02/02"),format="%Y/%m/%d")
data2 <- subset(data,Date %in% days)
png(file = "plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))

#top left
with(data2, plot(datetime,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
#bottom left
with(data2, plot(datetime,Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
with(data2, lines(datetime,Sub_metering_1, type = "l", col = "black"))
with(data2, lines(datetime,Sub_metering_2, type = "l", col = "red"))
with(data2, lines(datetime,Sub_metering_3, type = "l", col = "blue"))
legend("topright", cex = .8, lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#top right
with(data2, plot(datetime,Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))
#bottom left
with(data2, plot(datetime,Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime"))

dev.off()