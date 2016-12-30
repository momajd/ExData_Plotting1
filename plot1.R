# Estimate size of data set:
# 2,075,259 rows * 9 columns = 18677331
# 18677331 * (8 bytes / numeric) * (1 MB / 2^20 bytes) = 142.5 MB
# Therefore, OK to work with in memory

# Read file
df <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?", stringsAsFactors = FALSE)

# Convert date and time to Date objects; Use only dates between 2007-02-01 and 2007-02-02
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02", ]
# convert time after removing rows for efficiency
df$Time <- strptime(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")

# Plot 1 
png(filename="plot1.png", width = 480, height = 480)
hist(df$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()