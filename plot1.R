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

#plot and save the histogram "Global Active Power" as png
png(file = "plot1.png")
hist(data_set[,3], col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()