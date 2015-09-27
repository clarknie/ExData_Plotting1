# Q5: How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
# Load data 
#################################################################################
NEI <- readRDS('../data/exdata-data-NEI_data/summarySCC_PM25.rds')
SCC <- readRDS('../data/exdata-data-NEI_data/Source_Classification_Code.rds')

# Generate plot5.png
#################################################################################

# According to the code book: http://www3.epa.gov/ttn/chief/net/2008neiv3/2008_neiv3_tsd_draft.pdf
# Data.Category of "Onroad" corresponds to the SCC that is vehicle related.
vehicle_baltimore = NEI[NEI$fips == "24510" & NEI$SCC %in% unique(SCC$SCC[SCC$Data.Category == "Onroad"]),]
toPlot5 <- with(vehicle_baltimore, tapply(Emissions, year, sum))
png("plot5.png") 
plot(x = names(toPlot5), y = toPlot5, type = 'l', main = "Total emission of vehicles in Baltimore", xlab = "Year", ylab = "Total Emission in tons")
dev.off()
