## Note: 
## This script was created on a Windows 7 x64, R version: R version 3.1.1 (2014-08-10)

## data source file stored on "Data\Coursera\exdata-004\Programm Assigment 1\data\" folder 
## scripts are saved in the   "Data\Coursera\exdata-004\Programm Assigment 1\ExData_Plotting1\" folder

R.Version()$version.string
Sys.info()["sysname"]
Sys.info()["release"]


setwd("C:/Data/Coursera/exdata-004/Programm Assigment 1/ExData_Plotting1/")
fileName <- "../data/household_power_consumption.txt"

#
#  Load data from file:
#  

d.draft <- read.table(fileName,  header = TRUE,   sep=";", na.strings = c("?"))


# filter loaded dataset and bind row with converted to datetime  "Date", "Time" factor
d <- d.draft[d.draft$Date == "2/2/2007" | d.draft$Date == "1/2/2007",]
d <- data.frame(d, datetime =  strptime( paste(d$Date,d$Time), "%d/%m/%Y %H:%M:%S"))

names(d)
str(d)
## check first weekday: head(format (d$datetime, "%a"))

#
# Plot plot1 and save result to file:
#

png(file = "plot1.png", width = 480, height = 480)

hist(d$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()

