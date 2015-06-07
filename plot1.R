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
png(filename = "plot1.png", width = 480, height = 480)

with(hpcData,
     hist(Global_active_power, col = "red",
          xlab = "Global Active Power (kilowatts)",
          ylab = "Frequency",
          main = "Global Active power")
    )

# Close the output device
dev.off()

