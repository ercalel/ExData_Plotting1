# Loading data
file_name <- "household_power_consumption.zip"
if(!file.exists(file_name)) {
  url_file <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
  download.file(url = url_file, destfile = file_name, method = "curl")
} else {
  print("El archivo ya existe...")
}

if(file.exists(file_name)) {
  unzip(zipfile = file_name)
} else {
  print("El archivo no existe...")
}

data <- read.table("household_power_consumption.txt", header = T, sep = ";")
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

date_time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
global_active_power <- as.numeric(Global_active_power)

# Plot 2
png("plot2.png", width = 480, height = 480)
plot(date_time, global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()

