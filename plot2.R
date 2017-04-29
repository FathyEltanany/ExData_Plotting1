src<-paste(getwd(),"household_power_consumption.txt",sep = "/")
data<-read.table(src,header = T,na.strings = "?",stringsAsFactors = F)

data$Time <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
data[, 1] <- as.Date(data$Date, format = "%d/%m/%Y")

data <- data[format(data$Date, "%Y-%m-%d") == "2007-02-01" | format(data$Date, "%Y-%m-%d") == "2007-02-02" ,]

png(filename = "plot2.png")
plot(data$Time, data$Global_active_power, type = "l", xlab= "", ylab = "Global Active Power (kilowatts)")
dev.off()