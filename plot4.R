#Reading data from the file 
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?") 

#Subseting data_full by specified dates
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

#Concatenating date and time after converting to character
datetime <- paste(data1$Date, data1$Time)

#Converting datetime to class representing calendar dates and times("POSIXlt" and "POSIXct")
data1$Datetime <- as.POSIXct(datetime)

#Plotting the graphs with proper annotations and saving to png file
png("plot4.png", height=480, width=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data1, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", ylab="Global_reactive_power",xlab="datetime")
})

dev.off()
