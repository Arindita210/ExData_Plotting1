#Reading data from the file 
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?") 

#Subseting data_full by specified dates
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

#Concatenating date and time after converting to character
datetime <- paste(data1$Date, data1$Time)

#Converting datetime to class representing calendar dates and times("POSIXlt" and "POSIXct")
data1$Datetime <- as.POSIXct(datetime)

#Making and saving plot 3 as png
png("plot3.png", height=480, width=480)
with(data1, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
