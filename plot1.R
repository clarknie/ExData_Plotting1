# Q1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
# Load data 
#################################################################################
NEI <- readRDS('../data/exdata-data-NEI_data/summarySCC_PM25.rds')
SCC <- readRDS('../data/exdata-data-NEI_data/Source_Classification_Code.rds')

# Generate plot1.png
#################################################################################
toPlot1 <- with(NEI, tapply(Emissions, year, sum))
png("plot1.png") 
plot(x = names(toPlot1), y = toPlot1, type = 'l', main = "Total emission of PM2.5 in Tons", xlab = "Year", ylab = "PM2.5")
dev.off()
