# Q2: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
# Load data 
#################################################################################
NEI <- readRDS('../data/exdata-data-NEI_data/summarySCC_PM25.rds')
SCC <- readRDS('../data/exdata-data-NEI_data/Source_Classification_Code.rds')

# Generate plot2.png
#################################################################################
png("plot2.png") 
toPlot2 <- with(subset(NEI, fips == "24510"), tapply(Emissions, year, sum))
plot(x = names(toPlot2), y = toPlot2, type = 'l', main = "Total emission of PM2.5 in Tons at Baltimore", xlab = "Year", ylab = "PM2.5")
dev.off()
