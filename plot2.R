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
plot(subsetdf$DateTime,subsetdf$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=" ")
# Copying the plot to a png file and naming it plot2.png
dev.copy(png,"plot2.png")
# Closing the connection to the graphics device png to view it 
dev.off()

