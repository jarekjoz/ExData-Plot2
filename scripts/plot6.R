### Motor vehicle emissions in Baltimore

## Subset motor vehicle emissions codes
motorCodes <- sccodes[grepl(x=sccodes[,4], 
                            pattern="mobile", 
                            ignore.case=TRUE),]
motorCodes <- as.character(motorCodes$SCC)

## Subset Baltimore and LA motor vehicle emissions
pm25data$SCC <- as.character(pm25data$SCC)
baltMoto<- pm25data[pm25data$fips == "24510" & pm25data$SCC %in% motorCodes,]
LAMoto<- pm25data[pm25data$fips == "06037" & pm25data$SCC %in% motorCodes,]

## Sum emissions from motor vehicles
totalBaltMoto <- tapply(baltMoto$Emissions,  # Baltimore
                        baltMoto$year,
                        sum)
totalLAMoto <- tapply(LAMoto$Emissions,  # LA
                        LAMoto$year,
                        sum)

## Plot graph
png("./plots/plot6.png")
options(scipen=20) # gives correct number format
par(mfrow=c(1,2))

# Plots graph for Baltimore
barplot(totalBaltMoto, 
        unique(pm25data$year),
        axis.lty=1, 
        cex.axis=0.6, 
        col="orange",
        ylim=c(0,13000),
        xlab ="Year",
        ylab="pm25 Emissions",
        main="Total pm25 emissions 
        from motor vehicles 
        in Baltimore by year")

# Plots graph for LA
barplot(totalLAMoto, 
        unique(pm25data$year),
        axis.lty=1, 
        cex.axis=0.6, 
        col="green",
        ylim=c(0,13000),
        xlab ="Year",
        ylab="pm25 Emissions",
        main="Total pm25 emissions 
        from motor vehicles 
        in LA county by year")
dev.off()