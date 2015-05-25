##
##  Exploratory Data Analysis: Course Project 2
##
## Plot 4: Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
##

library(ggplot2)

## This first line will likely take a few seconds. Be patient!
if (!"NEI" %in% ls())
        NEI <- readRDS("summarySCC_PM25.rds")

if (!"SCC" %in% ls())
        sccData <- readRDS("Source_Classification_Code.rds")


coal <- grep("coal", SCC$Short.Name, ignore.case = T)
coal <- SCC[coal, ]
sNEI <- NEI[NEI$SCC %in% coal$SCC, ]

## Group and Summarize the Data
sNEI <- aggregate(. ~ year, data=sNEI[,c("year", "Emissions")], FUN=sum)
#sNEI <- NEI[order(NEI$year),]

## Plot
plot(sNEI$year, sNEI$Emissions, pch = 16, xlab="Year", ylab="Total PM25 Emissions")
abline(lm(sNEI$Emissions~sNEI$year),col=1,lty=2)


## Save to PNG File
dev.copy(png,'plot4.png')
dev.off()
