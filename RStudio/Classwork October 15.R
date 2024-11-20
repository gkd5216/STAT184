library(tidyverse)
data("iris")
sepal_length <- iris$Sepal.Length #Focus on Sepal Length

## Approach 1
min(sepal_length, na.rm = TRUE) #Sample Minimum
quantile(sepal_length, 0.25, na.rm = TRUE) #First Quartile
quantile(sepal_length, 0.5, na.rm = TRUE) #Sample Median
quantile(sepal_length, 0.75, na.rm = TRUE) #Third Quartile
max(sepal_length, na.rm = TRUE) #Sample Maximum

## Approach 2
quantile(sepal_length, c(0, 0.25, 0.5, 0.75, 1), na.rm = TRUE)
#str(iris)
#summary(iris)

## Approach 3
summary(sepal_length)

## Approach 4
#No group by because does not need group by for values from dataset
iris %>%
  summarise(minimum = min(sepal_length, na.rm = TRUE),
            first_quartile = quantile(sepal_length, 0.25, na.rm = TRUE),
            median = quantile(sepal_length, 0.5, na.rm = TRUE),
            third_quartile = quantile(sepal_length, 0.75, na.rm = TRUE),
            maximum = max(sepal_length, na.rm = TRUE))


            