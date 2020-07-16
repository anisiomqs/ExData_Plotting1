source("data.R")

df <- getData()
cacher <- makeCacheData(df)
df2 <- cacheSolve(cacher)

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# First plot: Global Active Power x Datetime
with(df2, plot(DateTime, Global_active_power, type="l", 
               ylab = "Global Active Power",
               xlab = ""))

# Second plot: Voltage x Datetime
with(df2, plot(DateTime, Voltage, type="l", ylab = "Voltage"))

# Third plot: Sub_meterings x Datetime
with(df2, plot(DateTime, Sub_metering_1, type="n", 
               ylab = "Energy sub metering",
               xlab = ""))
points(df2$DateTime, df2$Sub_metering_1, type = "l", col = "black")
points(df2$DateTime, df2$Sub_metering_2, type = "l", col = "red")
points(df2$DateTime, df2$Sub_metering_3, type = "l", col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, box.lwd = 0)

# Fourth plot: Global Reactive Power x Datetime
with(df2, plot(DateTime, Global_reactive_power, type="l"))

dev.off()

print("plot4 saved")