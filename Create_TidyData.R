# Create a tidy dataset.
rm(list = ls())
suppressMessages(library(dplyr)) # bind_rows
suppressMessages(library(data.table)) 
#select columns when loading
# The Excel spreadsheet data was converted to 8 csv files.
# And put into a subfolder from the 
# working directory named Data.
# These were renamed FINAL1.csv, FINAL2.csv...FINAL8.csv
setwd("Data")
files <- list.files(pattern = "*FINAL[1-38].csv")
data <- bind_rows(lapply(files, fread, 
        select = c(2,4:8),header=FALSE, skip=1))
files2 <- list.files(pattern = "*FINAL[4-7].csv")
data2 <- bind_rows(lapply(files2, fread, 
        select = c(2,4:8),header=FALSE, skip=1))
data2$V2 <- as.character(data2$V2)
data <- rbind(data,data2)
rm(data2,files,files2)
dim(data)
colnames(data) <- c("Precinct","first",
    "second", "third", "fourth","fifth")
names(data)
#Clean the data names and save the tidy data.
#First
data$first <- gsub("REP Poliquin,.+$","Poliquin",data$first)
data$first <- gsub("DEM Golden,.+$","Golden",data$first)
data$first <- gsub("Bond,.+$","Bond",data$first)
data$first <- gsub("Hoar,.+$","Hoar",data$first)
# Second
data$second <- gsub("REP Poliquin,.+$","Poliquin",data$second)
data$second <- gsub("DEM Golden,.+$","Golden",data$second)
data$second <- gsub("Bond,.+$","Bond",data$second)
data$second <- gsub("Hoar,.+$","Hoar",data$second)
#third
data$third <- gsub("REP Poliquin,.+$","Poliquin",data$third)
data$third <- gsub("DEM Golden,.+$","Golden",data$third)
data$third <- gsub("Bond,.+$","Bond",data$third)
data$third <- gsub("Hoar,.+$","Hoar",data$third)
#Fourth
data$fourth <- gsub("REP Poliquin,.+$","Poliquin",data$fourth)
data$fourth <- gsub("DEM Golden,.+$","Golden",data$fourth)
data$fourth <- gsub("Bond,.+$","Bond",data$fourth)
data$fourth <- gsub("Hoar,.+$","Hoar",data$fourth)
#Fifth
data$fifth <- gsub("REP Poliquin,.+$","Poliquin",data$fifth)
data$fifth <- gsub("DEM Golden,.+$","Golden",data$fifth)
data$fifth <- gsub("Bond,.+$","Bond",data$fifth)
data$fifth <- gsub("Hoar,.+$","Hoar",data$fifth)
write.csv(data,"MaineTidyData2018.csv", row.names = FALSE)
