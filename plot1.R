#Reading data from the file 
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?") 

#Subseting data_full by specified dates
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

#Saving Plot as PNG files of 480x480 pixels
png(filename = "plot1.png", width = 480, height = 480, 
    units = "px")
hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
