

library(sqldf)
Sys.setlocale("LC_TIME", "English")

#plot2
df <- read.csv.sql("household_power_consumption.txt", sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";", eol="\n")
df$DateTime <- paste(df$Date, df$Time, sep = ' ')
df$DateTime <- strptime(df$DateTime, format="%d/%m/%Y %H:%M:%S")

png(filename="plot2.png")

plot(df$DateTime, df$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(df$DateTime, df$Global_active_power)

dev.off()