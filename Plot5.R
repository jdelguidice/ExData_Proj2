##
##  Exploratory Data Analysis: Course Project 2
##
## Q5: ow have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
##

library(ggplot2)

## This first line will likely take a few seconds. Be patient!
if (!"NEI" %in% ls())
        NEI <- readRDS("summarySCC_PM25.rds")

if (!"SCC" %in% ls())
        sccData <- readRDS("Source_Classification_Code.rds")


sNEI <- NEI[NEI$fips=="24510",]
sNEI <- sNEI[sNEI$type == "ON-ROAD",]


## Group and Summarize the Data
sNEI <- aggregate(Emissions ~ year + fips, data=sNEI, FUN=sum)


## Plot
plot(sNEI$year, sNEI$Emissions, pch = 16, xlab="Year", ylab="Total PM25 Emissions")
abline(lm(sNEI$Emissions~sNEI$year),col=1,lty=2)


## Save to PNG File
dev.copy(png,'plot5.png')
dev.off()
