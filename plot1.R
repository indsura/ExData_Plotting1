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
hist(subsetdf$Global_active_power, main="Global Active Power",xlab = "Global Active Power (kilowatts)",col="red")
# Copying the plot to a png file and naming it plot1.png
dev.copy(png,"plot1.png")
# Closing the connection to the graphics device png to view it 
dev.off()
