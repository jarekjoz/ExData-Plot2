### Coal-related emissions
## Subset coal-related codes
coalCodes <- sccodes[grepl(x=sccodes[,4], 
                           pattern="coal", 
                           ignore.case=TRUE),]
coalCodes <- coalCodes$SCC