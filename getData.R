zipFile = "exdata-data-household_power_consumption.zip"
dataFile = "household_power_consumption.txt"

# Check if the data exists and is the corrrect size, otherwise get it
if (!file.exists(dataFile) |
    file.size(dataFile) != 132960755)
{
  download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile = zipFile)
  unzip(zipFile)
}

# Check if the data has already been loaded and only relaod if necessary
if (!exists("hpcData") || is.null(hpcData) || nrow(hpcData) != 2880)
{
  hpcData <- (
    fread("household_power_consumption.txt", sep = ";", header = T, na.strings = "?",
          colClasses = c("character", "character", "character", "character", "character", "character", "character", "character", "character")) %>%
      unite(DateTime, Date, Time, sep=" ", remove = T) %>%
      mutate(DateTime = dmy_hms(DateTime),
             Global_active_power = as.numeric(Global_active_power),
             Global_reactive_power = as.numeric(Global_reactive_power),
             Voltage = as.numeric(Voltage),
             Global_intensity  = as.numeric(Global_intensity),
             Sub_metering_1 = as.numeric(Sub_metering_1),
             Sub_metering_2 = as.numeric(Sub_metering_2),
             Sub_metering_3 = as.numeric(Sub_metering_3)) %>%
      filter(DateTime >= dmy("1/2/2007") & DateTime < dmy("3/2/2007"))
  )
}
