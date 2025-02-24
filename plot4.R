## load the data to the file project1data, only load the relevant lines by skipping the line prevoius to first date needed. Only load 2880 recording because that is how many there would be in 2 days if recorrded once a minute (60*48)
## na accounataned for
project1data <- read.table("household_power_consumption.txt", sep=";",skip = 66637, na.strings = "?",nrows = 2880)

##change date coloum to a date format
project1data$V1 <- as.Date(project1data$V1,"%d/%m/%Y")
## combine data and time coloum
project1data$timetemp <- paste(project1data$V1, project1data$V2)

##make it so the computer can read it as a date time

project1data$V2 <- strptime(project1data$timetemp, format ="%Y-%m-%d %H:%M:%S")

##make the file

png(file="plot4.png")

##create 2 by 2 space for graphs
par(mfrow = c(2, 2))
##plot first graph
plot(project1data$V2,project1data$V3, pch=".",ylab="Global Active Power(kilowatts)", xlab = "")
lines(project1data$V2,project1data$V3)
##plot second graph
plot(project1data$V2,project1data$V5, pch=".",ylab="Voltage", xlab = "datetime")
lines(project1data$V2,project1data$V5)
##plot third graph
plot(project1data$V2,project1data$V7, pch=".",xlab = "",ylab = "Energy sub metering")
##plot the first line
lines(project1data$V2,project1data$V7)
##plot the second line
lines(project1data$V2,project1data$V8, col = "red")
##plot third line
lines(project1data$V2,project1data$V9, col = "blue")
##add a legend
legend("topright", bty = "n",col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty = 1)
##plot last graph
plot(project1data$V2,project1data$V4, pch=".",ylab="Global_reactive_power", xlab = "datetime")
lines(project1data$V2,project1data$V4)
##close file
dev.off()


