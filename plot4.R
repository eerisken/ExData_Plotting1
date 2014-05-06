

library(sqldf)
Sys.setlocale("LC_TIME", "English")

#plot4
df <- read.csv.sql("household_power_consumption.txt", sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";", eol="\n")
df$DateTime <- paste(df$Date, df$Time, sep = ' ')
df$DateTime <- strptime(df$DateTime, format="%d/%m/%Y %H:%M:%S")

png(filename="plot4.png")

par(mfrow=c(2,2))

plot(df$DateTime, df$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(df$DateTime, df$Global_active_power)

plot(df$DateTime, df$Voltage, type="n", ylab="Voltage", xlab="datetime")
lines(df$DateTime, df$Voltage)

plot(df$DateTime, df$Sub_metering_1, type="n", ylab="Energy Sub Metering", xlab="")
lines(df$DateTime, df$Sub_metering_1)
lines(df$DateTime, df$Sub_metering_2, col="red")
lines(df$DateTime, df$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))

plot(df$DateTime, df$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
lines(df$DateTime, df$Global_reactive_power)

dev.off()