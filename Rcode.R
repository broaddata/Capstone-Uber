# Open data file and see data types and load dplyr 
uberjohn <-  read.csv("uber-data-set.csv")
str(uberjohn)
library(dplyr)

#Create day variable for user-friendly day names for later use in grouping.
filter(uberjohn, substr(uberjohn$ID,1,3) == "MON")
uberjohn$day[substr(uberjohn$ID,1,3) == "MON"] <- "Monday"
uberjohn$day[substr(uberjohn$ID,1,3) == "TUE"] <- "Tuesday"
uberjohn$day[substr(uberjohn$ID,1,3) == "WED"] <- "Wednesday"
uberjohn$day[substr(uberjohn$ID,1,3) == "THU"] <- "Thursday"
uberjohn$day[substr(uberjohn$ID,1,3) == "FRI"] <- "Friday"
uberjohn$day[substr(uberjohn$ID,1,3) == "SAT"] <- "Saturday"
uberjohn$day[substr(uberjohn$ID,1,3) == "SUN"] <- "Sunday"
mean(uberjohn$Trip_time_Percent, trim = 0, na.rm = FALSE)
mean(uberjohn$Trip_Mileage_Percent, trim = 0, na.rm = FALSE)
mean(uberjohn$Earnings_Per_Hour, trim = 0, na.rm = FALSE)

#Not sure why I loaded the scales library. John, you seem to be using it for the percent function below.
library(scales)

#Get the means for Trip_Time_Percent and Trip_Mileage_Percent
percent(mean(uberjohn$Trip_time_Percent, trim = 0, na.rm = FALSE))
percent(mean(uberjohn$Trip_Mileage_Percent, trim = 0, na.rm = FALSE))

# Load ggplot2 for graphics
library(ggplot2)

#check datatypes in uberjohn
str(uberjohn)

#Add /2016 to Trip_Date for converting to date data-type.
uberjohn$Trip_Date <- paste0(uberjohn$Trip_Date, "/2016")
uberjohn$Trip_Date <- as.character(uberjohn$Trip_Date)
str(uberjohn)
uberjohn$Trip_Date <- as.Date(uberjohn$Trip_Date, "%m/%d/%Y")

#Create new variable Trip_Date_Full, populate it with data from Trip_Date and set it as a date data-type.
uberjohn$Trip_Date <- c(uberjohn$Trip_Date)
uberjohn$Trip_Date_Full <- as.Date(uberjohn$Trip_Date, "%m/%d/%Y")

#verify Trip_Date_Full data-type.
str(uberjohn$Trip_Date_Full)

#Plot the Trip Time data 
p1 <- ggplot(uberjohn, aes(y = Trip_time_Percent, x = Trip_Date_Full)) + geom_point()
p1 <- p1 + labs(title = "Trip Time Efficiency", x = "Dates", y = "Trip % of Drive Time")

# Here's where I get stuck. I want to put in the mean of the Trip_time_Percent, but for some reason I either get errors or no graph.
p1 + geom_hline(yintercept = mean(uberjohn$Trip_time_Percent))
cor_eph <- uberjohn$Total_Payment / uberjohn$Work_Time_converted
cor_eph
