setwd("C:/Users/qian.li/Dropbox/data science/Exploratory analysis")

##Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
##which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
##Which have seen increases in emissions from 1999–2008? 
##Use the ggplot2 plotting system to make a plot answer this question.
install.packages("Rcpp")
install.packages("ggplot2")
library(Rcpp)
library(ggplot2)

NEI <- readRDS("./Project 2/summarySCC_PM25.rds")
SCC <- readRDS("./Project 2/Source_Classification_Code.rds")



# Baltimore City, Maryland == fips
MD <- subset(NEI, fips == 24510)

#another way to do it: MD <- NEI[NEI$fips=="24510",]
MD$year <- factor(MD$year, levels = c('1999', '2002', '2005', '2008'))

png('./Project 2/plot3.png', width = 800, height = 500, units = 'px')
ggplot(MD,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*"Emissions, Balitmore City, 1999-2008 by Source Type"))

dev.off()