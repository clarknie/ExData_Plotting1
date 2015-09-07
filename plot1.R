# Load data and subset to two days only (2007-02-01 and 2007-02-02)
#################################################################################

dat <- read.csv('../household_power_consumption.txt', sep = ";", na.strings = "?")
# Date in format dd/mm/yyyy; select only the 2007-02-01 and 2007-02-02
dat_sub <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")

# transform date and time into DateTime that R understands
dat_sub <- transform(dat_sub, DateTime = strptime(paste(Date, Time), 
                                                  format = "%d/%m/%Y %H:%M:%S"))

# Generate plot1.png
#################################################################################

png("plot1.png") # default to be width = 480, height = 480 pixels
with(dat_sub, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()
