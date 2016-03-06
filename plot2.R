#data loading
dat <- read.table("household_power_consumption.txt",header=TRUE,sep=';',na.strings='?')
#as date and time are factors , we need to convert them to date time format
dat$Date <- as.Date(dat$Date,'%d/%m/%Y')
dat <- subset(dat,dat$Date == as.Date('2007-02-01') | dat$Date==as.Date('2007-02-02'))
dat$Time <- strptime(dat$Time,'%H:%M:%S')
dat$Time <- strftime(dat$Time,'%H:%M:%S')
#plot2
png("plot2.png",height=480,width=480)
dat$dattime <- as.POSIXct((paste(dat$Date,dat$Time)))
png(file='plot2.png',height=480,width=480)
plot(dat$dattime,dat$Global_active_power,type='l',ylab="Global Active Power (kilowatts)",xlab='')
dev.off()
