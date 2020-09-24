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

# Plot 1
png("plot1.png", width = 480, height = 480)
hist(as.numeric(data$Global_active_power), 
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (Kilowatts)")
dev.off()


