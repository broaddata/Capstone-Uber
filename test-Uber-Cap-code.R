filter(uberjohn, uberjohn$ID != "SAT0423")
uberjohn2 <- filter(uberjohn, uberjohn$ID != "SAT0423")

#Earnings minus outlier on April 23
p3a <- ggplot(uberjohn2, aes(y = Earnings_Per_Hour, x = Trip_Date_Full)) + geom_point()
p3a <- p3a + labs(title = "Earnings Efficiency", x = "Dates", y = "Earnings Per Hour") + geom_hline(yintercept = mean(cor_eph))
p3a <- p3a + annotate("text", y = 6, x = mdy("5/05/2016"), label = paste("Mean: ", format(mean(cor_eph), digits = 4))) + annotate("rect", xmin = mdy("4/26/2016"), xmax = mdy("5/14/2016"), ymin = 4, ymax = 7, alpha = .2)
p3a <- p3a + geom_smooth()
p3a


p1 <- ggplot(uberjohn, aes(y = Trips, x = Trip_Date_Full)) + geom_point()
p1 <- p1 + labs(title = "Trips", x = "Dates", y = "No. of Trips") + geom_hline(yintercept = mean(uberjohn$Trips))
p1 <- p1 + annotate("text", y = 0.25, x = mdy("5/05/2016"), label = paste("Mean: ", format(mean(uberjohn$Trips, trim = 0, na.rm = FALSE), digits = 4)))
p1 <- p1 + geom_smooth()
p1

str(uberjohn)

num_trips <- uberjohn$Trips
df_paybyday <- data.frame(df_paybyday, num_trips)

df_paybyday$dow <- ordered(df_paybyday$dow, c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))
p4 <- ggplot(df_paybyday) +  geom_boxplot(aes(x = dow, y = num_trips))
p4 <- p4 + labs(title = "Trips by Days of the Week", x = "Days", y = "Trips")
p4