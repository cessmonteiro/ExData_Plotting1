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
with(hpc, plot(Sub_metering_1~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
with(hpc, lines(Sub_metering_2~DateTime,col='Red'))
with(hpc, lines(Sub_metering_3~DateTime,col='Blue'))

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to a file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()