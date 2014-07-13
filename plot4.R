## Note: 
## This script was created on a Windows 7 x64, R version: R version 3.1.1 (2014-07-10)

## data source file stored on "Data\Coursera\exdata-004\Programm Assigment 1\data\" folder 
## scripts are saved in the   "Data\Coursera\exdata-004\Programm Assigment 1\ExData_Plotting1\" folder

R.Version()$version.string
Sys.info()["sysname"]
Sys.info()["release"]


setwd("C:\\Data\\Coursera\\exdata-004\\Programm Assigment 1\\ExData_Plotting1\\")
fileName <- "..\\data\\household_power_consumption.txt"

#
#  Load data from file:
#  

initial <- read.table(fileName,  header = TRUE, sep=";", nrows = 1000, na.strings <- c("?"))
classes <- sapply(initial, class)

d.draft <- read.table(fileName,  header = TRUE,   sep=";", na.strings = c("?"))

#
# filter loaded dataset and bind row with converted to datetime  "Date", "Time" factor
#

d <- d.draft[d.draft$Date == "2/2/2007" | d.draft$Date == "1/2/2007",]

d <- data.frame(d, datetime =  strptime( paste(d$Date,d$Time), "%d/%m/%Y %H:%M:%S"))

names(d)
str(d)
## check first weekday: head(format (d$datetime, "%a"))
head(format (d$datetime, "%a"))


#
# Plot plot4 and save result to file:
#


png(file = "plot4.png", width = 480, height = 480)

par(mfcol = c(2, 2));


  # plot 4.1 - Global Active Power 
  plot(d$datetime, d$Global_active_power, type = "l", ylab="Global Active Power", xlab="")
  
  # plot 4.2 - Energy sub metering
  
  plot(d$datetime, d$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab="")
  lines(d$datetime, d$Sub_metering_2, col="red")
  lines(d$datetime, d$Sub_metering_3, col="blue")
  
  legend("topright", bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
     lty=c(1,1,1), # gives the legend appropriate symbols (lines)
     lwd=c(1,1,1)) # gives the legend lines appropriate width
  
  #plot 4.3 - Voltage
  plot(d$datetime, d$Voltage, type = "l", ylab="Voltage", xlab="datetime")
  
  #plot 4.4 = Global Reactive Power
  plot(d$datetime, d$Global_reactive_power, type = "l", ylab="Global_reactive_power", , xlab="datetime")

dev.off()