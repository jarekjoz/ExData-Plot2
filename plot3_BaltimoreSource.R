### Overall emission in Baltimore broken by the four sources

## Produce relevant dataset
baltimore <- pm25data[pm25data$fips == "24510",] # subset Baltimore
balt.split <- split(baltimore, 
                    baltimore$type) # split by source type

## Calculate sums broken down by source and year
# POINT
pointSum <- tapply(balt.split$POINT[,4], 
                   balt.split$POINT[,6],
                   sum)
pointSum <- as.data.frame(pointSum)
pointSum$year <- rownames(pointSum)
pointSum$type <- as.factor("POINT")
colnames(pointSum)[1] <- "totalEmissions"
# NONPOINT
nonPointSum <- tapply(balt.split$NONPOINT[,4],
                      balt.split$NONPOINT[,6], 
                      sum)
nonPointSum <- as.data.frame(nonPointSum)
nonPointSum$year <- rownames(nonPointSum)
nonPointSum$type <- as.factor("NONPOINT")
colnames(nonPointSum)[1] <- "totalEmissions"
# ONROAD
roadSum <- tapply(balt.split$"ON-ROAD"[,4], 
                  balt.split$"ON-ROAD"[,6], 
                  sum)
roadSum <- as.data.frame(roadSum)
roadSum$year <- rownames(roadSum)
roadSum$type <- as.factor("ONROAD")
colnames(roadSum)[1] <- "totalEmissions"
# NONROAD
nonRoadSum <- tapply(balt.split$"NON-ROAD"[,4], 
                     balt.split$"NON-ROAD"[,6], 
                     sum)
nonRoadSum <- as.data.frame(nonRoadSum)
nonRoadSum$year <- rownames(nonRoadSum)
nonRoadSum$type <- as.factor("NONROAD")
colnames(nonRoadSum)[1] <- "totalEmissions"

## Create one dataframe with sums for all types
allTypes <- rbind(pointSum, 
                  nonPointSum, 
                  roadSum, 
                  nonRoadSum)
rownames(allTypes) <- NULL

## Generate barplots for each source of pm25
qplot(year, 
      totalEmissions,
      data = allTypes,
      color	= type,
      geom	= "bar", 
      stat = "identity", 
      fill = type, 
      facets = .~type)	