##
##  Exploratory Data Analysis: Course Project 2
##
## Plot 2: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008 
##

## This first line will likely take a few seconds. Be patient!
if (!"NEI" %in% ls())
        NEI <- readRDS("summarySCC_PM25.rds")

if (!"SCC" %in% ls())
        sccData <- readRDS("Source_Classification_Code.rds")


## Group and Summarize the Data
NEI <- NEI[NEI$fips=="24510",]
sNEI <- aggregate(. ~ year, data=NEI[,c("year", "Emissions")], FUN=sum)
sNEI <- sNEI[order(sNEI$year),]

## Plot
plot(sNEI$year, sNEI$Emissions, pch = 16, xlab="Year", ylab="Total PM25 Emissions (MD)")
abline(lm(sNEI$Emissions~sNEI$year),col=1,lty=2)

## Save to PNG File
dev.copy(png,'plot2.png')
dev.off()
