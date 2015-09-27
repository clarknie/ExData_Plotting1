# Q4: # Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
# Load data 
#################################################################################
NEI <- readRDS('../data/exdata-data-NEI_data/summarySCC_PM25.rds')
SCC <- readRDS('../data/exdata-data-NEI_data/Source_Classification_Code.rds')

# Generate plot4.png
#################################################################################

# According to the code book: http://www3.epa.gov/ttn/chief/net/2008neiv3/2008_neiv3_tsd_draft.pdf
# SCC.Level.Three with a keyword of "Coal" would be coal combustion-related record
coal <- NEI[NEI$SCC %in% SCC$SCC[grep("Coal", SCC$SCC.Level.Three)], ]
toPlot4 <- with(coal, tapply(Emissions, year, sum))
toPlot4
png("plot4.png") 
plot(x = names(toPlot4), y = toPlot4, type = 'l', main = "Total emission of Coal related source", xlab = "Year", ylab = "Total Emission in tons")
dev.off()
