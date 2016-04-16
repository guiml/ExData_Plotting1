
##############################################
###### READ FILE
##############################################

power_comp_data <- read.csv("./data/household_power_consumption.txt", header = T, sep=";", na.strings="?")
#head(power_comp_data)


##############################################
###### SET NEW COLUMN WITH FORMATED DATE*
##############################################
#*According to the Brazilian standard time

library(data.table)
power_comp_data$FormatedDate <- as.Date(power_comp_data$Date , "%d/%m/%Y")
power_comp_data <- data.table(power_comp_data)
#head(power_comp_data)


##############################################
###### SUBSET BY DAYS 01 and 02 of feb 2007
##############################################
#*According to the Brazilian standard time
df <- power_comp_data[power_comp_data$FormatedDate == "2007-02-01"| power_comp_data$FormatedDate == "2007-02-02"]

##############################################
###### SET VALUES AS NUMERIC
##############################################

library(datasets)
df$GApower <- as.numeric(df$Global_active_power)


##############################################
###### GENERATE HISTOGRAM
##############################################

png(filename="graphs/plot1.png")
hist(df$GApower, col="yellow", main="Global Active Power", xlab="Global Active Power (kilowatts)") 
dev.off()



