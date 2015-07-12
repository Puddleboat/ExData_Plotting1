####
## Coursera - Exploratory data analysis
## Course project 1
## Plot 3
####

## read in data set 
HPC  <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

## We will only be using data from the dates 2007-02-01 and 2007-02-02
HPC.byDate <- HPC[HPC$Date %in% c("1/2/2007", "2/2/2007"),]

## Set date and time format
HPC.byDate$datetime <- strptime(paste(HPC.byDate$Date, HPC.byDate$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Separate out data for graph and set class to numeric 
GAP <- as.numeric(HPC.byDate$Global_active_power)

## Separate out date time date for graph Y axis
datetime <- HPC.byDate$datetime

## Separate out 3 x submetering data for graph
sub1 <- as.numeric(HPC.byDate$Sub_metering_1)
sub2 <- as.numeric(HPC.byDate$Sub_metering_2)
sub3 <- as.numeric(HPC.byDate$Sub_metering_3)

## Set graphics device
window("plot3.png", width=480, height=480)

## Create graph
plot(datetime, sub1, type="l", ylab="Energy Submetering", xlab="")

## Add 2nd line
lines(datetime, sub2, type="l", col="red")

## Add 3rd line
lines(datetime, sub3, type="l", col="blue")

## Add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Close graphics device
dev.off()
