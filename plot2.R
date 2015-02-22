setwd("C:/Users/qian.li/Dropbox/data science/Exploratory analysis")

# Plot 2:Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
Use the base plotting system to make a plot answering this question.

#Loads RDS
NEI <- readRDS("./Project 2/summarySCC_PM25.rds")
SCC <- readRDS("Project 2/Source_Classification_Code.rds")


# Subsets data and appends two years in one data frame
MD <- subset(NEI, fips == '24510')

png(filename = './Project 2/plot2.png')
barplot(tapply(X = MD$Emissions, INDEX = MD$year, FUN = sum), main = 'Total Emission in Baltimore City, MD', xlab = 'Year', ylab = expression('PM'[2.5]))
dev.off()
