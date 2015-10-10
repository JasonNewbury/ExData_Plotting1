
## load the data to the file project1data, only load the relevant lines by skipping the line prevoius to first date needed. Only load 2880 recording because that is how many there would be in 2 days if recorrded once a minute (60*48)
## na accounataned for
project1data <- read.table("household_power_consumption.txt", sep=";",skip = 66637, na.strings = "?",nrows = 2880)

## open the file, default width and height are 480px
png(file="plot1.png")
## make the graph, name axix, chart and colour bars
hist(project1data$V3, xlab = "Global Active Power (kilowatts)",main="Global Active Power", col = "red")
## close connection
dev.off()

