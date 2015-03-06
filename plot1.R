data<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
data.subset1<-subset(data,data$Date==c("1/2/2007"))
data.subset2<-subset(data,data$Date==c("2/2/2007"))
data.subset3<-subset(data,data$Date==c("3/2/2007"))
data.subset<-rbind(data.subset1,data.subset2,data.subset3)

png("plot1.png", width=480, height=480)
hist(as.numeric(data.subset$Global_active_power[1:2880]),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power",ylim=c(0,1300))
dev.off()
