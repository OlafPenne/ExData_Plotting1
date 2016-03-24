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


## Create Plot 2

png(filename = "Plot2.png", width = 480, height = 480)
par(mar=c(5.1,5.1,4.1,2.1))
plot(Power_consumption_subset$Global_active_power,type="o",pch="",ylab="Global Active Power (in kilowatts)",xlab="", xaxt="n") 
axis(1,  at=c(0,1440,2880),labels  = c("Thu","Fri","Sat"))
dev.off()

