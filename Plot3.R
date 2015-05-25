##
##  Exploratory Data Analysis: Course Project 2
##
## Plot 3: Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
##

library(ggplot2)

## This first line will likely take a few seconds. Be patient!
if (!"NEI" %in% ls())
        NEI <- readRDS("summarySCC_PM25.rds")

if (!"SCC" %in% ls())
        sccData <- readRDS("Source_Classification_Code.rds")


## Group and Summarize the Data
NEI <- NEI[NEI$fips=="24510",]
sNEI <- aggregate(Emissions ~ year + type, data=NEI, FUN=sum)

g <- ggplot(sNEI, aes(year, Emissions))
g + geom_point(shape=1) +
        facet_wrap(~type, ncol=2, nrow=2) +
        geom_smooth(method = "lm", se=FALSE) +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle("Total Emissions Trend by 'type'")


## Save to PNG File
dev.copy(png,'plot3.png')
dev.off()
