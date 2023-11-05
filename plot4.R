#download and unzip file
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/data.zip")
unzip(zipfile="./data/data.zip", exdir="./data")

#import data set from txt file
file_name <- "data/household_power_consumption.txt"
data_set <- read.table(file_name, header = TRUE, sep = ";", na.strings = "?")

#subset data from the dates 2007-02-01 and 2007-02-02
data_set <- data_set[data_set$Date %in% c("1/2/2007", "2/2/2007"),]

#set language to English
Sys.setlocale("LC_TIME", "English")

#convert the Date and Time variables to Date/Time classes
date <- as.Date(data_set[,1], format = "%d/%m/%Y")
time <- strptime(data_set[,2], format = "%H:%M:%S")

#create variable with time for plotting
time_axis <- as.POSIXct(paste(date, data_set[,2]))

#plot and save four plots as one png file
png(file = "plot4.png")
#set canvas to 2 by 2
par(mfrow = c(2,2))
#first plot
plot(time_axis, data_set[,3], xlab = "", ylab = "Global Active Power", type = "l")
#second plot
plot(time_axis, data_set[,5], xlab = "datetime", ylab = "Voltage", type = "l")
#third plot
plot(time_axis, data_set[,7], xlab = "", ylab = "Energy sub metering", type = "l")
lines(time_axis, data_set[,8], col = "red")
lines(time_axis, data_set[,9], col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
#fourth plot
plot(time_axis, data_set[,4], xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()