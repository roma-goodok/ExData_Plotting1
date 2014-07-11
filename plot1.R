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

ds <- read.table(fileName,  header = TRUE,   sep=";", na.strings = c("?"))

#
# filter loaded dataset and bind row with converted to datetime  "Date", "Time" factor
#


d <- ds[ds$Date == "2/2/2007" | ds$Date == "1/2/2007",]
d.tidy <- d;
d.tidy <- data.frame(d, datetime =  strptime( paste(d$Date,d$Time), "%d/%m/%Y %H:%M:%S"))

names(d.tidy)
str(d.tidy)
## check first weekday: head(format (d_tidy$datetime, "%a"))

