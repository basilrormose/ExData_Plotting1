library(dplyr)
library(data.table)
library(lubridate)
library(tidyr)

# Checks if the source data file exists and downloads
# it if necessaery.
# Checks if the data.table 'hpcData' exists and has
# the correct number of rows, otherwise loads the raw
# data from the source data file, loads and processes
# it.
source("getData.R")

# Set the output device/file
png(filename = "plot3.png", width = 480, height = 480)

with(hpcData, plot(DateTime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(hpcData, points(DateTime, Sub_metering_1, type = "l", col = "black"))
with(hpcData, points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(hpcData, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright",
       lty = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the output device
dev.off()
