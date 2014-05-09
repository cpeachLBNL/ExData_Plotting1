## plot2.R:  
## Load dataset, filter between 2 dates, plot line graph to png file

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
yTitle <- "Global Active Power (kilowatts)"
png(filename = "plot2.png", width = 480, height = 480, bg = "gray56")
plot(df$DateTime, df$Global_active_power, type="l", xlab="", ylab=yTitle)
dev.off()