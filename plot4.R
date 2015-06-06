# EXPLORATORY DATA ANALYSIS
# 
# Plotting Assignment 1:
# plot4.R

#Set Working Directory

    setwd("C:\\Users\\Victor\\Documents\\R\\R-WorkingDirectory")
    setwd(".\\02 - DataScienceCoursera\\ExploratoryDataAnalysis")


#Getting started

    #We will only be using data from the dates 2007-02-01 and 2007-02-02. 
    #Find out the correspondind lines for these dates
    startLine = grep("1/2/2007", readLines("household_power_consumption.txt"))[1]
    endLine   = grep("3/2/2007", readLines("household_power_consumption.txt"))[1]
    
    #Read and format the data
    col_class <- rep("numeric", 9)
    col_class[1:2] <- rep("character", 2)
    data <- read.table("household_power_consumption.txt", header = F, 
                       sep = ";", na.strings = "?", colClasses = col_class,
                       skip = startLine - 1, nrows = endLine - startLine)
    names(data) <- names(read.table("household_power_consumption.txt", 
                                    sep=";", header = T, nrows = 1))
    data$Date <- as.Date(data$Date, format = "%e/%m/%Y");
    data$DateTime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
    rm(col_class)
    
    #Open png graph device
    png(file = "plot4.png", width = 480, height = 480)
    
    #Generate graphs
    
        #Multiple graphs 
        par(mfrow = c(2,2))
    
        #plot[1,1]
        plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", 
            ylab = "Global Active Power (kilowatts)")
        
        #plot[1,2]
        plot(data$DateTime, data$Voltage, type = "l",
            xlab = "datetime", ylab = "Voltage")
    
        #plot[2,1]
        plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", 
             ylab = "Energy sub metering")
        points(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
        points(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n")
    
        #plot[2,2]
        plot(data$DateTime, data$Global_reactive_power, type = "l", 
            xlab = "datetime", ylab = "Global_reactive_power");
    
        #Close the png file device
        dev.off()  