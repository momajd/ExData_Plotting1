# Read file
df <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?", stringsAsFactors = FALSE)

# Convert date and time to Date objects; Use only dates between 2007-02-01 and 2007-02-02
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02", ]
# convert time after removing rows for efficiency
df$Time <- strptime(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")

# Plot 2 
with(df, plot(Time, Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)"))