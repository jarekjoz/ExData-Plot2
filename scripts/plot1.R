### Overall emission in the States
## Sum emissions from all sources
totalEmissions <- tapply(pm25data$Emissions,
                         pm25data$year,
                         sum)
## Plot graph
png("./plots/plot1.png")
options(scipen=20) # gives correct number format
barplot(totalEmissions, 
        unique(pm25data$year),
        axis.lty=1, 
        cex.axis=0.6, 
        col="orange",
        xlab ="Year",
        ylab="pm25 Emissions",
        main="Total pm25 emissions in the US by year") # plots graph
dev.off()