


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
png("plot2.png", width=480, height=480)

#plot requiered plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#always close dev connection
dev.off()

