data<-read.csv("/home/kele/Documents/Work/courses/coursera/peng/household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
data.subset1<-subset(data,data$Date==c("1/2/2007"))
data.subset2<-subset(data,data$Date==c("2/2/2007"))
data.subset3<-subset(data,data$Date==c("3/2/2007"))
data.subset<-rbind(data.subset1,data.subset2,data.subset3)

Sys.setlocale("LC_TIME", "en_GB.UTF-8") 

png("plot2.png", width=480, height=480)
plot(as.numeric(data.subset$Global_active_power[1:2880]),ylab="Global Active Power (kilowatts)",xlab="",xaxt="n",type="l")
ix <- seq(1, length(data.subset$Global_active_power), by=1440) #every 1 day
fmt <- "%a" 
labs <- format(as.Date(data.subset$Date[ix],'%d/%m/%Y'), fmt)
axis(side = 1, at = ix, labels = labs,  cex.axis = 0.7)
dev.off()
