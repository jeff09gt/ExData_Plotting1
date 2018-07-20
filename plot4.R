


##set a local working directory for this quiz



##download the data from the provided URL

myURL = paste("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",sep = "")

dir = "zippedFile.zip"
download.file(myURL, dir, mode="wb")


##unzip the file
unzip("zippedFile.zip")

dataFile <- ".//household_power_consumption.txt"
pj01_data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#based on the project description, the Project will use only a range of dates:

pj01_data <- pj01_data[pj01_data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(pj01_data$Date, pj01_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(pj01_data$Global_active_power)
globalReactivePower <- as.numeric(pj01_data$Global_reactive_power)
voltage <- as.numeric(pj01_data$Voltage)
subMtrng1 <- as.numeric(pj01_data$Sub_metering_1)
subMtrng2 <- as.numeric(pj01_data$Sub_metering_2)
subMtrng3 <- as.numeric(pj01_data$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMtrng1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMtrng2, type="l", col="red")
lines(datetime, subMtrng3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
#plot requiered plot
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
#always close dev connection
dev.off()
