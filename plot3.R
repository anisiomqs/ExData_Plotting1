source("data.R")

df <- getData()
cacher <- makeCacheData(df)
df2 <- cacheSolve(cacher)

png(filename = "plot3.png", width = 480, height = 480)

with(df2, plot(DateTime, Sub_metering_1, type="n", 
               ylab = "Energy sub metering",
               xlab = ""))
points(df2$DateTime, df2$Sub_metering_1, type = "l", col = "black")
points(df2$DateTime, df2$Sub_metering_2, type = "l", col = "red")
points(df2$DateTime, df2$Sub_metering_3, type = "l", col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)

dev.off()

print("plot3 saved")