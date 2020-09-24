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

# Plot 3
png("plot3.png", width = 480, height = 480)
with(data, {
  plot(date_time, Sub_metering_1, type = "l", ylab="Energy Submetering", xlab="")
  lines(date_time, Sub_metering_2, col = "red", type = "l",)
  lines(date_time, Sub_metering_3, col = "blue", type = "l",)
  legend("topright", 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty=1, 
         lwd=2.5, 
         col=c("black", "red", "blue"))
})
dev.off()
