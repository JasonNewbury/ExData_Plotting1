## load the data to the file project1data, only load the relevant lines by skipping the line prevoius to first date needed. Only load 2880 recording because that is how many there would be in 2 days if recorrded once a minute (60*48)
## na accounataned for
project1data <- read.table("household_power_consumption.txt", sep=";",skip = 66637, na.strings = "?",nrows = 2880)

##change date coloum to a date format
project1data$V1 <- as.Date(project1data$V1,"%d/%m/%Y")
## combine data and time coloum
project1data$timetemp <- paste(project1data$V1, project1data$V2)

project1data$V2 <- strptime(project1data$timetemp, format ="%Y-%m-%d %H:%M:%S")




## open the file, default width and height are 480px
png(file="plot2.png")
## label axis and plot data
plot(project1data$V2,project1data$V3, pch=".",ylab="Global Active Power(kilowatts)", xlab = "")
##connect everything with a line
lines(project1data$V2,project1data$V3)
##close file

dev.off()
