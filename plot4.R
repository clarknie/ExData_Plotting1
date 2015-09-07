# Load data and subset to two days only (2007-02-01 and 2007-02-02)
#################################################################################

dat <- read.csv('../household_power_consumption.txt', sep = ";", na.strings = "?")
# Date in format dd/mm/yyyy; select only the 2007-02-01 and 2007-02-02
dat_sub <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")

# transform date and time into DateTime that R understands
dat_sub <- transform(dat_sub, DateTime = strptime(paste(Date, Time), 
                                                  format = "%d/%m/%Y %H:%M:%S"))

# Generate plot4.png
#################################################################################

png("plot4.png") # default to be width = 480, height = 480 pixels
par(mfrow = c(2,2))

# top left
with(dat_sub, plot(DateTime, Global_active_power, xlab = "", ylab= "Global Active Power", type ="l" ))

# top right
with(dat_sub, plot(DateTime, Voltage, type ="l", xlab = "datetime"))

# bottom left

with(dat_sub, plot(DateTime, Sub_metering_1, main = "", type = "n", xlab = "", ylab = "Energy sub metering"))
with(dat_sub, lines(DateTime, Sub_metering_1, col = "black" ))
with(dat_sub, lines(DateTime, Sub_metering_2, col = "red" ))
with(dat_sub, lines(DateTime, Sub_metering_3, col = "blue" ))
legend("topright",  col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty="solid")

# bottom right
with(dat_sub, plot(DateTime, Global_reactive_power, xlab = "datetime", type ="l"))

dev.off()
