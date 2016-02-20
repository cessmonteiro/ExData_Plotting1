## Firstly, set your working directory with the working file provided

##  Load the file
all_data = read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

## Changes the Date
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")

## Subsets the data
hpc <- subset(all_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converts the dates
datetime <- paste(as.Date(hpc$Date), hpc$Time)
hpc$DateTime <- as.POSIXct(datetime)

## Making the plot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(hpc, plot(Global_active_power~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
with(hpc, plot(Voltage~DateTime, type="l", ylab="Voltage (volt)", xlab="datetime"))
with(hpc, plot(Sub_metering_1~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
with(hpc, lines(Sub_metering_2~DateTime,col='Red'))
with(hpc, lines(Sub_metering_3~DateTime,col='Blue'))

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(hpc, plot(Global_reactive_power~DateTime, type="l", ylab="Global Rective Power (kilowatts)",xlab="datetime"))

## Saving to a file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
