#load part of the dataset 
P1<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrow=2880,
               header=FALSE,col.names=c("Date","Time","Global_active_power",
                                        "Global_reactive_power","Voltage",
                                        "Global_intensity","Sub_metering_1",
                                        "Sub_metering_2","Sub_metering_3"),
               na.strings="?")
#convert date and time
P1$Date_Time <- strptime(paste(P1$Date, P1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
P1$Date<-as.Date(P1$Date,"%d/%m/%Y")

#plot3
# set up the plot 
png("plot3.png",width=480,height=480)
plot(P1$Date_Time, P1$Sub_metering_1, type="l", col="black",xlab="",
     ylab="Energy sub metering" ) 

# add lines 
lines(P1$Date_Time, P1$Sub_metering_2, type="l", col="red") 
lines(P1$Date_Time, P1$Sub_metering_3, type="l", col="blue") 

# add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()