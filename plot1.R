

library(sqldf)
Sys.setlocale("LC_TIME", "English")

#plot1 

df <- read.csv.sql("household_power_consumption.txt", sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";", eol="\n")

png(filename="plot1.png")

hist(df$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()
