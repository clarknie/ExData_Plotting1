# Load data and subset to two days only (2007-02-01 and 2007-02-02)
#################################################################################

dat <- read.csv('../household_power_consumption.txt', sep = ";", na.strings = "?")
# Date in format dd/mm/yyyy; select only the 2007-02-01 and 2007-02-02
dat_sub <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")

# transform date and time into DateTime that R understands
dat_sub <- transform(dat_sub, DateTime = strptime(paste(Date, Time), 
                                                  format = "%d/%m/%Y %H:%M:%S"))

# Generate plot3.png
#################################################################################

png("plot3.png") # default to be width = 480, height = 480 pixels
with(dat_sub, plot(DateTime, Sub_metering_1, main = "", type = "n", xlab = "", ylab = "Energy sub metering"))
with(dat_sub, lines(DateTime, Sub_metering_1, col = "black" ))
with(dat_sub, lines(DateTime, Sub_metering_2, col = "red" ))
with(dat_sub, lines(DateTime, Sub_metering_3, col = "blue" ))
legend("topright",  col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty="solid")
dev.off()
