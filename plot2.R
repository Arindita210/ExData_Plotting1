#Reading data from the file 
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?") 

#Subseting data_full by specified dates
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

#Concatenating date and time after converting to character
datetime <- paste(data1$Date, data1$Time)

#Converting datetime to class representing calendar dates and times("POSIXlt" and "POSIXct")
data1$Datetime <- as.POSIXct(datetime)

## Plot 2
with(data1, {plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")})
#Copying plot 2 to png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
