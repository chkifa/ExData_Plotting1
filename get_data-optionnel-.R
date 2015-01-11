if(!file.exists("EDA-P1")){dir.create("EDA-P1")}#create directory
fileUrl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = ".\\EDA-P1\\exdata-data-household_power_consumption.zip",mode = "wb")##download file from internet
list.files(".\\EDA-P1")##see if download it
unzip(".\\EDA-P1\\exdata-data-household_power_consumption.zip", list = FALSE, overwrite = FALSE, exdir = ".\\EDA-P1")
