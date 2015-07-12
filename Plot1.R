####
## Coursera - Exploratory data analysis
## Course project 1
## Plot 1
####

## read in data set 
HPC  <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

## We will only be using data from the dates 2007-02-01 and 2007-02-02
HPC.byDate <- HPC[HPC$Date %in% c("1/2/2007", "2/2/2007"),]

## Set date and time format
HPC.byDate$datetime <- strptime(paste(HPC.byDate$Date, HPC.byDate$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Separate out data for graph and set class to numeric 
GAP <- as.numeric(HPC.byDate$Global_active_power)

## Set graphics device
png("plot1.png", width=480, height=480)

## Create graph
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Close graphics device
dev.off()
