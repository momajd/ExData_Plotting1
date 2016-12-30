# Read file
df <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?", stringsAsFactors = FALSE)

# Convert date and time to Date objects; Use only dates between 2007-02-01 and 2007-02-02
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02", ]
# convert time after removing rows for efficiency
df$Time <- strptime(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")

# Plot 4 
par(mfrow=c(2, 2), cex=0.6, mar=c(5, 4, 4, 2) + 0.1)
with(df, plot(Time, Global_active_power, type="l", xlab="", ylab = "Global Active Power"))

with(df, plot(Time, Voltage, type="l", xlab="datetime"), fin=c(2, 2))

with(df, plot(Time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering") )
with(df, points(Time, Sub_metering_2, type="l", col="red"))
with(df, points(Time, Sub_metering_3, type="l", col="blue"))
legend("topright", col=c("black", "red", "blue"), bty="n", lty=1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(df, plot(Time, Global_reactive_power, type="l", xlab="datetime"))