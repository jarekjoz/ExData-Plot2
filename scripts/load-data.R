download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
              destfile="./data/data.zip", 
              method="curl", 
              quiet=FALSE)
unzip(zipfile="./data/data.zip",
      exdir="./data/")
unlink("./data/data.zip")
pm25data <- readRDS(file="./data/summarySCC_PM25.rds")
sccodes <- readRDS(file="./data/Source_Classification_Code.rds")