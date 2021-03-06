### Coal-related emissions
## Subset coal-related emissions
coalCodes <- sccodes[grepl(x=sccodes[,4], 
                           pattern="coal", 
                           ignore.case=TRUE),]
coalCodes <- as.character(coalCodes$SCC)
pm25data$SCC <- as.character(pm25data$SCC)
coalData <- pm25data[pm25data$SCC %in% coalCodes,]
## Sum emissions from all sources
totalEmissions <- tapply(coalData$Emissions,
                         coalData$year,
                         sum)
## Plot graph
png("./plots/plot4.png")
options(scipen=20) # gives correct number format
barplot(totalEmissions, 
        unique(coalData$year),
        axis.lty=1, 
        cex.axis=0.6, 
        col="orange",
        xlab ="Year",
        ylab="pm25 Emissions",
        main="Total pm25 coal-related emissions in the US by year") # plots graph
dev.off()