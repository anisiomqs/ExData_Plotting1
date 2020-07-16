source("data.R")

df <- getData()
cacher <- makeCacheData(df)
df2 <- cacheSolve(cacher)

png(filename = "plot1.png", width = 480, height = 480)

hist(df2$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

dev.off()

print("plot1 saved")