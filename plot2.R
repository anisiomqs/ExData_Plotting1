source("data.R")

df <- getData()
cacher <- makeCacheData(df)
df2 <- cacheSolve(cacher)

png(filename = "plot2.png", width = 480, height = 480)

with(df2, plot(DateTime, Global_active_power, type="l", 
               ylab = "Global Active Power (kilowatts)",
               xlab = ""))

dev.off()
print("plot2 saved")