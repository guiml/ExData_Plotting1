
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
###### SET VALUES AS NUMERIC AND MERGE DATE AND TIME
##############################################
library(datasets)
df$Global_active_power <- as.numeric(df$Global_active_power)
df$DateTime <- as.POSIXct(paste(df$FormatedDate, df$Time), format="%Y-%m-%d %H:%M:%S")


##############################################
###### GENERATE MULTIPLE PLOTS 
##############################################

png(filename="graphs/plot4.png")
par(mfrow = c(2,2))
with(df, {
  plot(df$DateTime, df$Global_active_power,  type = "l", col = "blue", ylab = "Global Active Power (kilowatts)", xlab=" ")
  plot(df$DateTime, df$Voltage,  type = "l", col = "blue", ylab = "Voltage", xlab=" ", main = " ")
  plot(df$DateTime, df$Sub_metering_1 ,  type = "l", col = "black", ylab = "Energy Sub Meetering", xlab=" ", ylim=c(0, 40))
  par(new=TRUE)
  plot(df$DateTime, df$Sub_metering_2 ,  type = "l", col = "yellow", ylab = "Energy Sub Meetering", xlab="",ylim=c(0, 40))
  par(new=TRUE)
  plot(df$DateTime, df$Sub_metering_3 ,  type = "l", col = "blue", ylab = "Energy Sub Meetering", xlab="", ylim=c(0, 40))
  legend("topright", inset=.05, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), fill=c("black","yellow","blue"))
  plot(df$DateTime, df$Global_reactive_power,  type = "l", col = "blue", ylab = "Global Reactive Power (kilowatts)", xlab=" ")
})


