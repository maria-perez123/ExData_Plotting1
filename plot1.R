#Loading data
#Reading, naming and subsetting power consumption data

## Checking if archive already exists.
filename <- "exdata_data_household_power_consumption.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, filename, method="curl")
}  

## Checking if folder exists
if (!file.exists("household_power_consumption.txt")) { 
  unzip(filename) 
}

power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

#Opening graphic device
png("plot1.png", width=480, height=480) 

#calling the basic plot function
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",
     main="Global Active Power",xlab="Global Active Power(kilowatts)")

# annotating graph
title(main="Global Active Power")
#Closing graphic device
dev.off()
