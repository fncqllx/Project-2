setwd("C:/Users/qian.li/Dropbox/data science/Exploratory analysis")

##Plot 4:Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008

NEI <- readRDS("./Project 2/data/summarySCC_PM25.rds")
SCC <- readRDS("./Project 2/data/Source_Classification_Code.rds")

library(Rcpp)
library(ggplot2)

# Coal-related SCC
SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE), ]

# Merges two data sets
merge <- merge(x = NEI, y = SCC.coal, by = 'SCC')
merge.sum <- aggregate(merge[, 'Emissions'], by = list(merge$year), sum)
colnames(merge.sum) <- c('Year', 'Emissions')


png('./Project 2/plot4.png')
ggplot(merge.sum, aes(x = Year, y = Emissions/1000)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission in Kilotons")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions from 1999-2008"))

dev.off()