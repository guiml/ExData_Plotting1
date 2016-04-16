
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

library(datasets)


df$Global_active_power <- as.numeric(df$Global_active_power)
df$DateTime <- as.POSIXct(paste(df$FormatedDate, df$Time), format="%Y-%m-%d %H:%M:%S")




png(filename="graphs/plot2.png")
plot(df$DateTime, df$Global_active_power,  type = "l", col = "blue", ylab = "Global Active Power (kilowatts)", xlab=" ",main = "Global Active Power by day")
dev.off()


