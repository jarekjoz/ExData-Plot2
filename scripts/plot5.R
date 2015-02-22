### Motor vehicle emissions in Baltimore

## Subset motor vehicle emissions codes
motorCodes <- sccodes[grepl(x=sccodes[,4], 
                           pattern="mobile", 
                           ignore.case=TRUE),]
motorCodes <- as.character(motorCodes$SCC)

## Subset Baltimore motor vehicle emissions
pm25data$SCC <- as.character(pm25data$SCC)
baltMoto<- pm25data[pm25data$fips == "24510" & pm25data$SCC %in% motorCodes,]

## Sum emissions from all sources
totalBaltMoto <- tapply(baltMoto$Emissions,
                      baltMoto$year,
                      sum)

## Plot graph
png("./plots/plot5.png")
options(scipen=20) # gives correct number format
barplot(totalBaltMoto, 
        unique(pm25data$year),
        axis.lty=1, 
        cex.axis=0.6, 
        col="orange",
        xlab ="Year",
        ylab="pm25 Emissions",
        main="Total pm25 emissions 
        produced by motor vehicles in Baltimore by year") # plots graph
dev.off()