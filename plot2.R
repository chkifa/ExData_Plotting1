if(!file.exists("EDA-P1")){dir.create("EDA-P1")}#create directory
fileUrl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = ".\\EDA-P1\\exdata-data-household_power_consumption.zip",mode = "wb")##download file from internet
list.files(".\\EDA-P1")##see if download it
unzip(".\\EDA-P1\\exdata-data-household_power_consumption.zip", list = FALSE, overwrite = FALSE, exdir = ".\\EDA-P1")

HH_power<-read.table(".\\EDA-P1\\household_power_consumption.txt",header=T,sep=";")
HH_power_P1 <- subset(HH_power, Date=="1/2/2007" | Date=="2/2/2007")

HH_power_P1_Date<- strptime(paste(HH_power_P1$Date, HH_power_P1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

HH_power_P1$Global_active_power <- as.numeric(HH_power_P1$Global_active_power)
is.numeric(HH_power_P1$Global_active_power)
par(bg = "white")
plot(HH_power_P1_Date,HH_power_P1$Global_active_power/1000, type="l",xlab="",ylab="Global active power(kilowatts)")
dev.copy(png,file=".\\GitHub\\ExData_Plotting1\\Plot2.png",width = 480, height = 480)     
dev.off()