#data loading
dat <- read.table("household_power_consumption.txt",header=TRUE,sep=';',na.strings='?')
#as date and time are factors , we need to convert them to date time format
dat$Date <- as.Date(dat$Date,'%d/%m/%Y')
dat<- subset(dat,dat$Date == as.Date('2007-02-01') | dat$Date==as.Date('2007-02-02'))
dat$Time <- strptime(dat$Time,'%H:%M:%S')
dat$Time <- strftime(dat$Time,'%H:%M:%S')

#plot3
dat$dattime <- as.POSIXct((paste(dat$Date,dat$Time)))
png(file='plot3.png',height=480,width=480)
plot(dat$Sub_metering_1~dat$dattime,type='l',ylab='Energy Sub metering',xlab='')
lines(dat$Sub_metering_2~dat$dattime,type='l',col='red')
lines(dat$Sub_metering_3~dat$dattime,col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col=c('black','red','blue'),lty=1,bty='l')
dev.off()
