data<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
data.subset1<-subset(data,data$Date==c("1/2/2007"))
data.subset2<-subset(data,data$Date==c("2/2/2007"))
data.subset3<-subset(data,data$Date==c("3/2/2007"))
data.subset<-rbind(data.subset1,data.subset2,data.subset3)

Sys.setlocale("LC_TIME", "en_GB.UTF-8") 

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(as.numeric(data.subset$Global_active_power[1:2880]),ylab="Global Active Power (kilowatts)",type="l",xlab="",xaxt="n")
ix <- seq(1, length(data.subset$Global_active_power), by=1440) #every 1 day
#Sys.setlocale("LC_TIME", "en_GB.UTF-8") 
fmt <- "%a" # format for axis labels
labs <- format(as.Date(data.subset$Date[ix],'%d/%m/%Y'), fmt)
axis(side = 1, at = ix, labels = labs,  cex.axis = 0.7)

plot(as.numeric(data.subset$Voltage[1:2880]),ylab="Voltage",xlab="datetime",xaxt="n",type="l")
ix <- seq(1, length(data.subset$Global_active_power), by=1440) #every 1 day
#Sys.setlocale("LC_TIME", "en_GB.UTF-8") 
fmt <- "%a" # format for axis labels
labs <- format(as.Date(data.subset$Date[ix],'%d/%m/%Y'), fmt)
axis(side = 1, at = ix, labels = labs,  cex.axis = 0.7)

plot(as.numeric(data.subset$Sub_metering_1[1:2880]),ylab="Energy sub metering",xlab="",xaxt="n",type="l",col="black")
lines(as.numeric(data.subset$Sub_metering_2[1:2880]),ylab="Energy sub metering",xlab="",xaxt="n",type="l",col="red")
lines(as.numeric(data.subset$Sub_metering_3[1:2880]),ylab="Energy sub metering",xlab="",xaxt="n",type="l",col="blue")
ix <- seq(1, length(data.subset$Sub_metering_1), by=1440) #every 1 day
#Sys.setlocale("LC_TIME", "en_GB.UTF-8") 
fmt <- "%a" # format for axis labels
labs <- format(as.Date(data.subset$Date[ix],'%d/%m/%Y'), fmt)
axis(side = 1, at = ix, labels = labs,  cex.axis = 0.7)
legend("topright",names(data.subset[7:9]),bty = "n",lty=c(1,1),col=c("black","red","blue"))


plot(as.numeric(data.subset$Global_reactive_power[1:2880]),ylab=names(data.subset[4]),xlab="datetime",xaxt="n",type="l",col="black")
ix <- seq(1, length(data.subset$Global_reactive_power), by=1440) #every 1 day
#Sys.setlocale("LC_TIME", "en_GB.UTF-8") 
fmt <- "%a" # format for axis labels
labs <- format(as.Date(data.subset$Date[ix],'%d/%m/%Y'), fmt)
axis(side = 1, at = ix, labels = labs,  cex.axis = 0.7)
dev.off()

