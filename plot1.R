#load part of the dataset 
P1<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrow=2880,
               header=FALSE,col.names=c("Date","Time","Global_active_power",
                                        "Global_reactive_power","Voltage",
                                        "Global_intensity","Sub_metering_1",
                                        "Sub_metering_2","Sub_metering_3"),
               na.strings="?")

#convert date time 
Date_Time <- strptime(paste(P1$Date, P1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
P1$Date<-as.Date(P1$Date,"%d/%m/%Y")

#plot1
png("plot1.png",width=480,height=480)
hist(P1$Global_active_power,col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()