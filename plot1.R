#----------------------------------------------------------------------------------
# plot1.R : Plot Histogram of Global Active Power
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

# Plot graphics
hist(plot_data$Global_active_power, col="red", main="Global Active Power", xlab='Global Active Power(kilowatts)')

# Create PNG file
dev.copy(png,'./ExploratoryAnalysis/plot1.png')
dev.off()
