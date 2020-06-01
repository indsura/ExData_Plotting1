# Importing libraries for fread
library(data.table)
library(dplyr)
# reading in the dataset using fread
mydf<-fread("household_power_consumption.txt",sep=";")
# converting the Date column in the dataframe to 'date' type
mydf$Date<-as.Date(mydf$Date,format = "%d/%m/%Y")
# subsetting the dataset based on the two dates of interest 
subsetdf<-filter(mydf,Date=="2007-02-01"|Date=="2007-02-02")
# converting Global_active_power to numeric datatype for plotting as histogram
subsetdf$Global_active_power<-as.numeric(subsetdf$Global_active_power)
# Converging the date and time column using paste and converting that conerged column to  # POSIXct type
subsetdf$DateTime<-as.POSIXct(paste(subsetdf$Date,subsetdf$Time,sep=" "))
# Setting graphical parameters for 2 graphs/row and cex=0.6
par(mfcol=c(2,2),cex=0.6)
# constructing plot 1
plot(subdf$DateTime,subdf$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=" ")
# constructing plot 2
plot(subdf$DateTime,subdf$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab=" ")
# adding more lines to plot 2
lines(subdf$DateTime,subdf$Sub_metering_2,col="red")
lines(subdf$DateTime,subdf$Sub_metering_3,col="blue")
# adding a legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",lty=1,lwd=2,col=c("black","red","blue"))
# constructing plot 3
plot(subdf$DateTime,subdf$Voltage,xlab="datetime",ylab="Voltage",type="l")
# constructing plot 4
plot(subdf$DateTime,subdf$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
# Copying the plot to a png file and naming it plot4.png
dev.copy(png,"plot4.png")
# Closing the connection to the graphics device png to view it 
dev.off()
