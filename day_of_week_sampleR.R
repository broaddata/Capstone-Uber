df_dayofweek <- read.csv("df_dayofweek.csv")

#load libraries needed for managing and plotting data
library(dplyr)
library(scales)
library(ggplot2)
library(lubridate)
library(tidyr)

#plot the data.
ggplot(df_dayofweek) +  geom_boxplot(aes(x = dayofweek, y = amount))

#Put the days of the week in proper order.
df_dayofweek$dayofweek <- ordered(df_dayofweek$dayofweek, c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))

#Re-run the box plot to see days of week re-ordered.
ggplot(df_dayofweek) +  geom_boxplot(aes(x = dayofweek, y = amount))
