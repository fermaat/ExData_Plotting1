## The data is read
table <- read.table (file="./data/household_power_consumption.txt", header=T, sep=";",
                    s tringsAsFactors=F, na.strings="?")
## only the data in the selected dates is taken into account
subtable <- table[(as.Date(table$Date, "%d/%m/%Y")== "2007-02-01") | (as.Date(table$Date, "%d/%m/%Y")== "2007-02-02"),]
## and the plot
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(subtable$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
