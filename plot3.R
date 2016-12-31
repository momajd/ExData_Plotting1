# Read file
df <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?", stringsAsFactors = FALSE)

# Convert date and time to Date objects; Use only dates between 2007-02-01 and 2007-02-02
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02", ]
# convert time after removing rows for efficiency
df$Time <- strptime(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")

# Plot 3
png(filename = "plot3.png", width=480, height=480)
par(cex=0.75)
with(df, plot(Time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(df, points(Time, Sub_metering_2, type="l", col="red"))
with(df, points(Time, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()