data <- read.table("household_power_consumption.txt",header = TRUE, sep=";")
dateTime <- paste(as.character(data$Date),as.character(data$Time))
library(lubridate)
data$DateTime <- dmy_hms(dateTime)
bDate <- ymd("2007-02-01")
eDate <- ymd("2007-02-03")
workData <- data[(data$DateTime >= bDate & data$DateTime < eDate),]
workData$Global_active_power <- as.numeric(as.character(workData$Global_active_power))
main <- "Global Active Power"
col = "Red"
xlab = "Global Active Power (kilowatts)"
hist(workData$Global_active_power,main = main,col = col,xlab = xlab)
dev.copy(png, file = "plot1.png")
dev.off()
