data <- read.table("household_power_consumption.txt",header = TRUE, sep=";")
dateTime <- paste(as.character(data$Date),as.character(data$Time))
library(lubridate)
data$DateTime <- dmy_hms(dateTime)
bDate <- ymd("2007-02-01")
eDate <- ymd("2007-02-03")
workData <- data[(data$DateTime >= bDate & data$DateTime < eDate),]
workData$Sub_metering_1 <- as.numeric(as.character(workData$Sub_metering_1))
workData$Sub_metering_2 <- as.numeric(as.character(workData$Sub_metering_2))
ylab = "Energy sub metering"
xlab = ""
plot(workData$DateTime,workData$Sub_metering_1,xlab = xlab,ylab = ylab, type = "n")
lines(workData$DateTime,workData$Sub_metering_1,type ="l")
lines(workData$DateTime,workData$Sub_metering_2,type ="l",col = "Red")
lines(workData$DateTime,workData$Sub_metering_3,type ="l",col = "Blue")
leg = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright",lty = 1, col = c("black", "red","blue"), legend = leg)

dev.copy(png, file = "plot3.png")
dev.off()