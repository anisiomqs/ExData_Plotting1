library(lubridate)
library(dplyr)

downloadDataset <- function() {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                destfile = "power_consumption.zip")
  unzip("power_consumption.zip")
}

getData = function() {
  if (!file.exists("household_power_consumption.txt")) {
    downloadDataset()
  }
  
  df <- read.csv("household_power_consumption.txt", sep = ";", 
                 na.strings = "?")
  df$DateTime <- dmy_hms(paste(df$Date, df$Time))
  df$Date <- dmy(df$Date)
  df$Time <- hms(df$Time)
  
  df
}

makeCacheData <- function(df = data.frame) {
  filteredDF <- NULL
  get <- function() df
  set <- function(newdf) {
    df <<- newdf
    filteredDF <- NULL
  }
  getFilteredDF <- function() filteredDF
  setFilteredDF <- function(newdf) filteredDF <- newdf
  
  list(set = set, get = get,
       getFilteredDF = getFilteredDF,
       setFilteredDF = setFilteredDF)
}

cacheSolve <- function(cacher, ...) {
  filtered <- cacher$getFilteredDF()
  
  if(!is.null(filtered)) {
    message("getting cached DF")
    return(filtered)
  }
  data <- cacher$get()
  initialDate <- dmy("1/2/2007")
  finalDate <- dmy("2/2/2007")
  filtered <- data %>% filter(Date >= initialDate, Date <= finalDate)
  cacher$setFilteredDF(filtered)
  filtered
}

