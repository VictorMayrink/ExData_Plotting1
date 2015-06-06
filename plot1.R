# EXPLORATORY DATA ANALYSIS
# 
# Plotting Assignment 1:
# plot1.R
    
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
    png(file = "plot1.png", width = 480, height = 480)
    
    #Generate Histogram
    hist(data$Global_active_power, col = "red",
        main = "Global Active Power",  
        xlab = "Global Active Power (kilowatts)",
        ylab = "Frequency")
    
    #Close the png file device
    dev.off()