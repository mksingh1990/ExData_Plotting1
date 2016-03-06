#data loading
dat <- read.table("household_power_consumption.txt",header=TRUE,sep=';',na.strings='?')
#as date and time are factors , we need to convert them to date time format
dat$Date <- as.Date(dat$Date,'%d/%m/%Y')
dat <- subset(dat,dat$Date == as.Date('2007-02-01') | dat$Date==as.Date('2007-02-02'))
dat$Time <- strptime(dat$Time,'%H:%M:%S')
dat$Time <- strftime(dat$Time,'%H:%M:%S')

#plot4
dat$dattime <- as.POSIXct((paste(dat$Date,dat$Time)))
png(file='plot4.png',height=480,width=480,units='px')
par(mfrow=c(2,2))
plot(dat$Global_active_power~dat$dattime,,type='l',ylab="Global Active Power (kilowatts)",xlab='')
plot(dat$Voltage~dat$dattime,type='l',xlab='datetime',ylab='Voltage')
plot(dat$Sub_metering_1~dat$dattime,type='l',ylab='Energy Sub Metering',xlab='')
lines(dat$Sub_metering_2~dat$dattime,col='red')
lines(dat$Sub_metering_3~dat$dattime,col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col=c('black','red','blue'),lty=1,bty='n')

plot(dat$Global_reactive_power~dat$dattime,type='l',ylab='Global_reactive_power',xlab='datetime')
dev.off()