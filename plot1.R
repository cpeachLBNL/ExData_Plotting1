## plot1.R:  
## Load dataset, filter between 2 dates, plot histogram to png file

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

## Plot Histogram to png file
mainTitle <- "Global Active Power"
xTitle <- "Global Active Power (kilowatts)"
yTitle <- "Frequency"
png(filename = "plot1.png", width = 480, height = 480, bg = "gray56")
hist(df$Global_active_power, breaks = 14, col="red", border="black",
     main=mainTitle, xlab=xTitle, ylab=yTitle)
dev.off()
