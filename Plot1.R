##
##  Exploratory Data Analysis: Course Project 2
##
## Plot 1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##

## This first line will likely take a few seconds. Be patient!
if (!"NEI" %in% ls())
        NEI <- readRDS("summarySCC_PM25.rds")

if (!"SCC" %in% ls())
        sccData <- readRDS("Source_Classification_Code.rds")


## Group and Summarize the Data
NEI <- aggregate(. ~ year, data=NEI[,c("year", "Emissions")], FUN=sum)
NEI <- NEI[order(NEI$year),]

## Plot
plot(NEI$year, NEI$Emissions, pch = 16, xlab="Year", ylab="Total PM25 Emissions")
abline(lm(NEI$Emissions~NEI$year),col=1,lty=2)

## Save to PNG File
dev.copy(png,'plot1.png')
dev.off()
