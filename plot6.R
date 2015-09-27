# Q6: Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
# Load data 
#################################################################################
NEI <- readRDS('../data/exdata-data-NEI_data/summarySCC_PM25.rds')
SCC <- readRDS('../data/exdata-data-NEI_data/Source_Classification_Code.rds')

# Generate plot6.png
#################################################################################

# plot Baltimore v.s. LA side by side
png("plot6.png") 
par(mfrow = c(1,2))

vehicle_baltimore = NEI[NEI$fips == "24510" & NEI$SCC %in% unique(SCC$SCC[SCC$Data.Category == "Onroad"]),]
toPlot6_baltimore <- with(vehicle_baltimore, tapply(Emissions, year, sum))
plot(x = names(toPlot6_baltimore ), y = toPlot6_baltimore , type = 'l', main = "Baltimore", xlab = "Year", ylab = "Total Emission in tons")

vehicle_la= NEI[NEI$fips == "06037" & NEI$SCC %in% unique(SCC$SCC[SCC$Data.Category == "Onroad"]),]
toPlot6_la <- with(vehicle_la, tapply(Emissions, year, sum))
plot(x = names(toPlot6_la), y = toPlot6_la, type = 'l', col = "red" , main = "Los Angeles ", xlab = "Year", ylab = "Total Emission in tons")
# Data.Category of "Onroad" corresponds to the SCC that is vehicle related.
dev.off()
