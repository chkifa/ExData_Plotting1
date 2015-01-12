if(!file.exists("EDA-P1")){dir.create("EDA-P1")}#create directory
fileUrl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = ".\\EDA-P1\\exdata-data-household_power_consumption.zip",mode = "wb")##download file from internet
list.files(".\\EDA-P1")##see if download it
unzip(".\\EDA-P1\\exdata-data-household_power_consumption.zip", list = FALSE, overwrite = FALSE, exdir = ".\\EDA-P1")

HH_power<-read.table(".\\EDA-P1\\household_power_consumption.txt",header=T,sep=";")
HH_power_P1 <- subset(HH_power, Date=="1/2/2007" | Date=="2/2/2007")

HH_power_P1_Date<- strptime(paste(HH_power_P1$Date, HH_power_P1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

HH_power_P1$Sub_metering_1 <- as.numeric(HH_power_P1$Sub_metering_1)
is.numeric(HH_power_P1$Sub_metering_1)

HH_power_P1$Sub_metering_2 <- as.numeric(HH_power_P1$Sub_metering_2)
is.numeric(HH_power_P1$Sub_metering_2)


HH_power_P1$Sub_metering_3 <- as.numeric(HH_power_P1$Sub_metering_3)
is.numeric(HH_power_P1$Sub_metering_3)
par(bg = "white")
par(mfrow=c(1,1))
plot(HH_power_P1_Date,HH_power_P1$Sub_metering_1, type="n",xlab="",ylab="Energy sub metering")
lines(HH_power_P1_Date,HH_power_P1$Sub_metering_1, col="black")
lines(HH_power_P1_Date,HH_power_P1$Sub_metering_2, col="red")
lines(HH_power_P1_Date,HH_power_P1$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       pch="-",lwd=3,col=c("black", "red", "blue"), bty="l")
	   
dev.copy(png,file=".\\GitHub\\ExData_Plotting1\\Plot3.png",width = 480, height = 480)     
dev.off()