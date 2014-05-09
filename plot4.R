## plot4.R:  
## Load dataset, filter between 2 dates, plot quad graph to png file

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

## Plot quad graph to png file
png(filename = "plot4.png", width = 480, height = 480, bg = "gray56")
par(mfrow = c(2, 2)) #Set global parameter - plots are 2 row x 2 col
with (df, {
        plot(DateTime, Global_active_power, type="l", xlab="", 
             ylab="Global Active Power", col="black")
        
        plot(DateTime, Voltage, type="l", xlab="datetime", 
             ylab="Voltage", col="black")
        
        plot(DateTime, Sub_metering_1, type="l", xlab="", 
             ylab="Energy sub meeting", col="black")
        lines(DateTime, Sub_metering_2, col="red")
        lines(DateTime, Sub_metering_3, col="blue")
        legend("topright", lty=1, col = c("black", "red", "blue"), bty="n", 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        plot(DateTime, Global_reactive_power, type="l", xlab="datetime", 
             ylab="Global_reactive_power", col="black")
        })
dev.off()

par(mfrow = c(1, 1)) #Reset global parameter - plots are 1 row x 1 col