####
## Coursera - Exploratory data analysis
## Course project 1
## Plot 4
####

## read in data set 
HPC  <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

## We will only be using data from the dates 2007-02-01 and 2007-02-02
HPC.byDate <- HPC[HPC$Date %in% c("1/2/2007", "2/2/2007"),]

## Set date and time format
HPC.byDate$datetime <- strptime(paste(HPC.byDate$Date, HPC.byDate$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Separate out date time date for graph Y axis
datetime <- HPC.byDate$datetime

## Separate out data for graph 1 and set class to numeric 
GAP <- as.numeric(HPC.byDate$Global_active_power)

## Separate out data for graph 2 and set class to numeric
Volt <- as.numeric(HPC.byDate$Voltage)

## Separate out 3 x data set for graph 3 and set class to numeric
sub1 <- as.numeric(HPC.byDate$Sub_metering_1)
sub2 <- as.numeric(HPC.byDate$Sub_metering_2)
sub3 <- as.numeric(HPC.byDate$Sub_metering_3)

## Separate out data for graph 4 and set class to numeric
GRP <- as.numeric(HPC.byDate$Global_reactive_power)