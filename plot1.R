## Note: 
## This script was created on a Windows
## data source file stored on "Data\Coursera\exdata-004\Programm Assigment 1\data\" folder 
## scripts are saved in the   "Data\Coursera\exdata-004\Programm Assigment 1\ExData_Plotting1\" folder

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

hist(d$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

