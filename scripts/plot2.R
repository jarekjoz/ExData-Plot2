### Overall emission in Baltimore
## Subset Baltimore
baltimore <- pm25data[pm25data$fips == "24510",]
## Sum emissions from all sources
totalEmBalt <- tapply(baltimore$Emissions,
                         baltimore$year,
                         sum)
## Plot graph
png("./plots/plot2.png")
options(scipen=20) # gives correct number format
barplot(totalEmBalt, 
        unique(pm25data$year),
        axis.lty=1, 
        cex.axis=0.6, 
        col="orange",
        xlab ="Year",
        ylab="pm25 Emissions",
        main="Total pm25 emissions in Baltimore by year") # plots graph
dev.off()