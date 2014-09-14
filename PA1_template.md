---
title: 'Reproducible Research: Peer Assessment 1'
output: html_document 


---

## Loading and preprocessing the data
Reading the data

```{r}

activity <- read.csv("activity.csv", colClasses = c("numeric", "character", "numeric"))
head(activity)

names(activity)

```{r}

library(lattice)

```

```{r}

activity$date <- as.Date(activity$date, "%Y-%m-%d")

```

## What is mean total number of steps taken per day?
First, calculate the mean number of steps for each day
and then let's look at the mean and median for the total steps per day:

```{r}

StepsTotal <- aggregate(steps ~ date, data = activity, sum, na.rm = TRUE)

hist(StepsTotal$steps, main = "Total steps by day", xlab = "day", col = "blue")

mean(StepsTotal$steps)

median(StepsTotal$steps)

```

```{r}

steps <- rep(NA, 61)
day <- rep("NA", 61)
stepsday <- tapply(activity$steps, activity$date, sum, na.rm = T)
length(stepsday)

for (i in 1:61) {
    steps[i] <- stepsday[[i]]
    day[i] <- names(stepsday)[i]
}

df <- data.frame(day, steps)
head(df)

hist(df$steps, main = "Total steps by day", xlab = "day", col = "orange")

```

## What is the average daily activity pattern?
Calculate the mean steps for each five minute interval, and then put it in a data frame.

```{r}

time_series <- tapply(activity$steps, activity$interval, mean, na.rm = TRUE)

plot(row.names(time_series), time_series, type = "l", xlab = "5-min interval", 
    ylab = "Average across all Days", main = "Average number of steps taken", 
    col = "blue")
    
max_interval <- which.max(time_series)
names(max_interval)

```

## Inputing missing values

```{r}

activity_NA <- sum(is.na(activity))
activity_NA

StepsAverage <- aggregate(steps ~ interval, data = activity, FUN = mean)
fillNA <- numeric()
for (i in 1:nrow(activity)) {
    obs <- activity[i, ]
    if (is.na(obs$steps)) {
        steps <- subset(StepsAverage, interval == obs$interval)$steps
    } else {
        steps <- obs$steps
    }
    fillNA <- c(fillNA, steps)
}

new_activity <- activity
new_activity$steps <- fillNA

StepsTotal2 <- aggregate(steps ~ date, data = new_activity, sum, na.rm = TRUE)

hist(StepsTotal2$steps, main = "Total steps by day", xlab = "day", col = "blue")

mean(StepsTotal2$steps)

median(StepsTotal2$steps)

```

## Are there differences in activity patterns between weekdays and weekends?

```{r}

day <- weekdays(activity$date)
daylevel <- vector()
for (i in 1:nrow(activity)) {
    if (day[i] == "Saturday") {
        daylevel[i] <- "Weekend"
    } else if (day[i] == "Sunday") {
        daylevel[i] <- "Weekend"
    } else {
        daylevel[i] <- "Weekday"
    }
}
activity$daylevel <- daylevel
activity$daylevel <- factor(activity$daylevel)

stepsByDay <- aggregate(steps ~ interval + daylevel, data = activity, mean)
names(stepsByDay) <- c("interval", "daylevel", "steps")

xyplot(steps ~ interval | daylevel, stepsByDay, type = "l", layout = c(1, 2), 
    xlab = "Interval", ylab = "Number of steps")
```    
