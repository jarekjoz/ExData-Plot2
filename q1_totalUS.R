### Overall emission in the States
## Sum emissions from all sources
totalEmissions <- tapply(pm25data$Emissions,
                         pm25data$year,
                         sum)
## Plot graph
options(scipen=20) # gives correct number format
barplot(totalEmissions, 
        unique(pm25data$year),
        axis.lty=1, 
        cex.axis=0.6, 
        col="orange") # plots graph
