#load and subset the data
A1Q1<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";")
A1Q1$Date<-as.Date(A1Q1$Date,format="%d/%m/%Y")
subset<-A1Q1[A1Q1$Date=="2007-02-01"|A1Q1$Date=="2007-02-02",]

#create plot1
subset$Global_active_power<-as.numeric(as.character(subset$Global_active_power))
hist(subset$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png,file="plot1.png")
dev.off()
