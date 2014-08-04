## local Spanish format is avoided for the plotting
Sys.setlocale("LC_TIME", "English")
## The data is read
table <- read.table (file="./data/household_power_consumption.txt", header=T, sep=";",
                     stringsAsFactors=F, na.strings="?")

## only the data in the selected dates is taken into account
subtable <- table[(as.Date(table$Date, "%d/%m/%Y")== "2007-02-01") | (as.Date(table$Date, "%d/%m/%Y")== "2007-02-02"),]
## including the ddmmYYYY HH:MM:SS format on the "DateTime column
subtable$DateTime <- strptime (paste (subtable$Date, subtable$Time), "%d/%m/%Y %H:%M:%S")
## and the plot
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
##1
with(subtable, plot (DateTime, Global_active_power, type ="l",
                     ylab="Global Active Power", xlab=""))
## 2
plot(subtable$DateTime, subtable$Voltage, type="l", ylab="Voltage", xlab="datetime")
##3
plot(subtable$DateTime, subtable$Sub_metering_1, type="l", ,
     ylab="Energy sub metering", xlab="")
lines(subtable$DateTime, subtable$Sub_metering_2, type="l", col="red", xlab="", ylab="")
lines(subtable$DateTime, subtable$Sub_metering_3, type="l", col="blue", xlab="", ylab="")
legend("topright", lty=1, lwd=1, col=c("black", "red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3" ), cex=0.6)

##4
plot(subtable$DateTime, subtable$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()