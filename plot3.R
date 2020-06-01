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
# Constructing the line plot 
plot(subsetdf$DateTime,subsetdf$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab=" ")
# Adding more lines to the plot using lines function
lines(subsetdf$DateTime,subsetdf$Sub_metering_2,col="red")
lines(subsetdf$DateTime,subsetdf$Sub_metering_3,col="blue")
# adding a legend 
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2,col=c("black","red","blue"))
# Copying the plot to a png file and naming it plot3.png
dev.copy(png,"plot3.png")
# Closing the connection to the graphics device png to view it 
dev.off()
