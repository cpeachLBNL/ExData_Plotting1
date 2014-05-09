## plot3.R:  
## Load dataset, filter between 2 dates, plot multi-line graph to png file

## Load full dataset
classes <- c("character", "character", "numeric", "numeric", "numeric", 
             "numeric", "numeric", "numeric", "numeric")
df <- read.table("household_power_consumption.txt", header = TRUE, sep=";", 
                 na.strings="?", colClasses=classes, comment.char="")

## Filter between 2 dates:
dateLower <- as.Date("2007-02-01", format="%Y-%m-%d")
dateUpper <- as.Date("2007-02-02", format="%Y-%m-%d")
df$Date2 <- as.Date(df$Date , "%d/%m/%Y")
df <- df[((df$Date2>=dateLower) & (df$Date2<=dateUpper)), ]
df$DateTime <- as.POSIXlt(paste(df$Date, df$Time, sep = " "), 
        format="%d/%m/%Y %H:%M:%S")

## Plot line graph to png file
png(filename = "plot3.png", width = 480, height = 480, bg = "gray56")
with (df, {
        plot(DateTime, Sub_metering_1, type="l", xlab="", 
             ylab="Energy sub meeting", col="black")
        lines(DateTime, Sub_metering_2, col="red")
        lines(DateTime, Sub_metering_3, col="blue")
        legend("topright", lty=1, col = c("black", "red", "blue"), 
                legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        })
dev.off()