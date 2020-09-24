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

# Plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(data, {
  plot(date_time, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
  plot(date_time, Voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(date_time, Sub_metering_1, type = "l", ylab="Energy Submetering", xlab="")
  lines(date_time, Sub_metering_2, col = "red", type = "l",)
  lines(date_time, Sub_metering_3, col = "blue", type = "l",)
  legend("topright", 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty=, 
         lwd=2.5, 
         col=c("black", "red", "blue"), bty="o")
  plot(date_time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
})
dev.off()
