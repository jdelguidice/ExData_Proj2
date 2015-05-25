##
##  Exploratory Data Analysis: Course Project 2
##
## Plot 6: Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
## vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater 
## changes over time in motor vehicle emissions?
##

library(ggplot2)

## This first line will likely take a few seconds. Be patient!
if (!"NEI" %in% ls())
        NEI <- readRDS("summarySCC_PM25.rds")

if (!"SCC" %in% ls())
        sccData <- readRDS("Source_Classification_Code.rds")

sNEI <- NEI[NEI$fips=="24510" | NEI$fips=="06037" ,]
sNEI <- sNEI[sNEI$type == "ON-ROAD",]


## Group and Summarize the Data
sNEI <- aggregate(Emissions ~ year + fips, data=sNEI, FUN=sum)

## Plot

g <- ggplot(sNEI, aes(year, Emissions))
g + geom_point(shape=1) +
        facet_wrap(~fips) +
        geom_smooth(method = "lm", se=FALSE) +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle("Total Emissions Trend / Baltimore and LA County")

## Save to PNG File
dev.copy(png,'plot6.png')
dev.off()
