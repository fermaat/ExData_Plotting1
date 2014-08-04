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
png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(subtable, plot (DateTime, Global_active_power, type ="l",
                     ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()