### Overall emission in Baltimore
## Subset Baltimore
baltimore <- pm25data[pm25data$fips == "24510",]
## Sum emissions from all sources
totalEmBalt <- tapply(baltimore$Emissions,
                         baltimore$year,
                         sum)
## Plot graph
options(scipen=20) # gives correct number format
barplot(totalEmBalt, 
        unique(pm25data$year),
        axis.lty=1, 
        cex.axis=0.6, 
        col="orange") # plots graph
