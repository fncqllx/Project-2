setwd("C:/Users/qian.li/Dropbox/data science/Exploratory analysis")

# Plot 1: Loads RDS
summary <- readRDS("./Project 2/summarySCC_PM25.rds")
SCC <- readRDS("./Project 2/Source_Classification_Code.rds")

##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##Using the base plotting system, make a plot showing the total PM2.5 emission 
##from all sources for each of the years 1999, 2002, 2005, and 2008.

Emissions <- aggregate(summary[, 'Emissions'], by = list(summary$year), FUN = sum)
Emissions$PM <- round(Emissions[, 2] / 1000, 2)

barplot(Emissions$PM, names.arg = Emissions$Group.1, main = expression('Total Emission of PM'[2.5]), xlab = 'Year', ylab = expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.copy(png,'./Project 2/plot1.png')
dev.off()


