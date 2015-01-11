if(!file.exists("EDA-P1")){dir.create("EDA-P1")}#create directory
fileUrl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = ".\\EDA-P1\\exdata-data-household_power_consumption.zip",mode = "wb")##download file from internet
list.files(".\\EDA-P1")##see if download it
unzip(".\\EDA-P1\\exdata-data-household_power_consumption.zip", list = FALSE, overwrite = FALSE, exdir = ".\\EDA-P1")


HH_power<-read.table(".\\EDA-P1\\household_power_consumption.txt",header=T,sep=";")
HH_power_P1 <- subset(HH_power, Date=="1/2/2007" | Date=="2/2/2007")
HH_power_P1$Global_active_power <- as.numeric(HH_power_P1$Global_active_power)
is.numeric(HH_power_P1$Global_active_power)
hist(HH_power_P1$Global_active_power/1000,xlab ="Global active power(kilowatts)",main="Global Active Power",col="red")
dev.copy(png,file=".\\GitHub\\ExData_Plotting1\\Plot1.png",width = 480, height = 480)     
dev.off()