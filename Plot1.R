## Load Data

power_consumption <- read.table("household_power_consumption.txt",sep=";",header=TRUE)

## Subset Data to 1&2 Feb 2007

Power_consumption_subset<-subset(power_consumption, Date=="1/2/2007"|Date=="2/2/2007")

## Convert date and time to date / time class and values to numeric
Power_consumption_subset$Date<-as.Date(Power_consumption_subset$Date,"%d/%m/%Y")
Power_consumption_subset$Time<-strptime(Power_consumption_subset$Time,"%H:%M:%S")
Power_consumption_subset$Global_active_power<-as.numeric(as.character(Power_consumption_subset$Global_active_power))
Power_consumption_subset$Global_reactive_power<-as.numeric(as.character(Power_consumption_subset$Global_reactive_power))
Power_consumption_subset$Voltage<-as.numeric(as.character(Power_consumption_subset$Voltage))
Power_consumption_subset$Global_intensity<-as.numeric(as.character(Power_consumption_subset$Global_intensity))
Power_consumption_subset$Sub_metering_1<-as.numeric(as.character(Power_consumption_subset$Sub_metering_1))
Power_consumption_subset$Sub_metering_2<-as.numeric(as.character(Power_consumption_subset$Sub_metering_2))
Power_consumption_subset$Sub_metering_3<-as.numeric(as.character(Power_consumption_subset$Sub_metering_3))

## Create Plot 1

png(filename = "Plot1.png", width = 480, height = 480)
hist(Power_consumption_subset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",col="red")
dev.off()

