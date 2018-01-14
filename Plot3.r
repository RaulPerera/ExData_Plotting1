##############################################################
#           Step 1: File and Data Prep
##############################################################
#
#
#File Source 
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#Originally from UCI Machine Learning Repository http://archive.ics.uci.edu/ml/
#Downloaded 1/14/2018
library(dplyr)
library(lubridate)
power_consumption <- as.tbl(
  read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
  )
#Store as temp to avoid having to reread in raw table as often
temp <- power_consumption %>%
  mutate(datetime=dmy_hms(paste(Date,Time))) %>%
  select(-c(Date,Time)) %>%
  filter(datetime>ymd("2007-02-01")& datetime<ymd("2007-02-03"))
##############################################################
#           Step 2: Initialize PNG File
############################################################## 
png("Plot3.png", 480, 480)
### If necessary run these to reset default paramater settings
#dev.cur() 
#dev.list()
#dev.off() 
##############################################################
#           Step 3: Create Plot
##############################################################
plot(
  as.numeric(temp$Sub_metering_1)~temp$datetime
  ,ylab = "Energy sub metering"
  ,xlab =""
  ,type="l"
)
points(
  as.numeric(temp$Sub_metering_2)~temp$datetime
  ,type="l"
  ,col="red"
)
points(
  as.numeric(temp$Sub_metering_3)~temp$datetime
  ,type="l"
  ,col="blue"
)
legend(
  "topright"
  ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
  ,lty = c(1,1,1)
  ,col=c("black","red","blue")
)

##############################################################
#           Step 4: Close PNG File
##############################################################
dev.off()





