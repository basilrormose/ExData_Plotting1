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
png(filename = "plot4.png", width = 480, height = 480)

# Set the number of plots to fit
par(mfrow = c(2,2))

# row 1, col 1
with(hpcData,
     plot(DateTime,
          Global_active_power,
          type = "l",
          xlab = "",
          ylab = "Global Active Power")
)

# row 1, col 2
with(hpcData,
     plot(DateTime,
          Global_active_power,
          type = "l",
          xlab = "datetime",
          ylab = "Voltage")
)

# row 2, col 1
with(hpcData, plot(DateTime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(hpcData, points(DateTime, Sub_metering_1, type = "l", col = "black"))
with(hpcData, points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(hpcData, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright",
       lty = 1,
       bty = "n",
       box.lwd = NA,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# row 2, col 2
with(hpcData,
     plot(DateTime,
          Global_reactive_power,
          type = "l",
          xlab = "datetime",
          ylab = "Global Reactive Power")
)

# Close the output device
dev.off()
