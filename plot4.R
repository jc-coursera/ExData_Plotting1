#----------------------------------------------------------------------------------
# plot4.R : Plot four graphics
#----------------------------------------------------------------------------------
# Our overall goal here is simply to examine how household energy usage varies over 
# a 2-day period in February, 2007(2007-02-01 and 2007-02-02). The task is to reconstruct the sample plots, all 
# of which were constructed using the base plotting system.
#
# . Construct the plot and save it to a PNG file with a width of 480 pixels and 
#   a height of 480 pixels.
#
# The data is from the UC Irvine Machine Learning Repository, a popular repository for 
# machine learning datasets. In particular, we will be using the 
# "Individual household electric power consumption Data Set"

# Description: Measurements of electric power consumption in one household with a one-minute 
# sampling rate over a period of almost 4 years. Different electrical quantities and some 
# sub-metering values are available.
#
# The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
#    
# . Date: Date in format dd/mm/yyyy
# . Time: time in format hh:mm:ss
# . Global_active_power: household global minute-averaged active power (in kilowatt)
# . Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# . Voltage: minute-averaged voltage (in volt)
# . Global_intensity: household global minute-averaged current intensity (in ampere)
# . Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# . Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# . Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
#
#----------------------------------------------------------------------------------
# Load Data
pwr_consumption <- read.table("./ExploratoryAnalysis/household_power_consumption.txt",header=TRUE,sep=";")
pwr_consumption$Date<-as.Date(pwr_consumption$Date,"%d/%m/%Y")

# Get plotting data
plot_data<-subset(pwr_consumption,Date>='2007-02-01' & Date<='2007-02-02')

# Convert data
plot_data$Global_active_power<-as.numeric(as.character(plot_data$Global_active_power))
plot_data$Global_reactive_power<-as.numeric(as.character(plot_data$Global_reactive_power))
plot_data$Voltage<-as.numeric(as.character(plot_data$Voltage))

plot_data$Sub_metering_1<-as.numeric(as.character(plot_data$Sub_metering_1))
plot_data$Sub_metering_2<-as.numeric(as.character(plot_data$Sub_metering_2))
plot_data$Sub_metering_3<-as.numeric(as.character(plot_data$Sub_metering_3))

# Create DateTime value
x <- paste(plot_data$Date, plot_data$Time)
plot_data$DateTime<-strptime(x, "%Y-%m-%d %H:%M:%S")


# Configur layout
par(mfrow=c(2,2), mar=c(5,4,3,2))

# Plot graphics 
with(plot_data, {
    # Plot graphics 1,1 - Global Active Power
    plot(DateTime, Global_active_power,type="l",ylab="Global Active Power(kilowatts)", xlab="")

    # Plot graphics 1,2 - Voltage
    plot(DateTime, Voltage,type="l",ylab="Voltage", xlab="datetime")
    
    # Plot graphics 2,1 - Energy sub metering
    plot(DateTime, Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")
    lines(DateTime, Sub_metering_2,type="l",col="red")
    lines(DateTime, Sub_metering_3,type="l",col="blue")
    legend("topright",lty=1,cex=0.6,bty="n",yjust=0, y.intersp=0.5, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    # Plot graphics 2,2 - Global Reactive Power
    plot(DateTime, Global_reactive_power,type="l", xlab="datetime")
    
            })

# Create PNG file
dev.copy(png,'./ExploratoryAnalysis/plot4.png')
dev.off()
