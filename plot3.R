# Q3: Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
# Load data 
#################################################################################
NEI <- readRDS('../data/exdata-data-NEI_data/summarySCC_PM25.rds')
SCC <- readRDS('../data/exdata-data-NEI_data/Source_Classification_Code.rds')

# Generate plot3.png
#################################################################################

# generate the dataframe with emissions sum, type, year
emission_sums <- numeric()
years <- character()
types <- character()
for (tp in with(NEI, unique(type))){
    types <- c(types, rep(tp, 4))
    temp <- with(subset(NEI, fips == "24510" & type == tp), tapply(Emissions, year, sum))
    emission_sums <- c(emission_sums, temp)
    years <- c(years, names(temp))
}
toPlot3 <- data.frame(EmissionsSum = emission_sums, Year = years, Type = types)
png("plot3.png") 
qplot(Year, EmissionsSum, data = toPlot3, geom = c("point" ), color = Type)
dev.off()
