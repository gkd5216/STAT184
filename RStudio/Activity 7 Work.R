#Libraries necessary for diamonds dataset
library(ggplot2)
library(dplyr)
data("diamonds") #Diamonds dataset
library(dplyr)

diamonds %>% #Use diamonds dataset
  group_by(cut) %>% #Group by the data's cut 
  summarise(
    count = n(), #Get count of diamonds for each cut
    across(.cols = c(x, y, z), .fns = list( #Apply this function to x, y, and z
      sample_minimum = ~min(.x, na.rm = TRUE), #Get minimum of x col
      first_quartile = ~quantile(.x, probs = 0.25, na.rm = TRUE), #Get first quartile of x col
      sample_median = ~median(.x, na.rm = TRUE), #Get sample median of x col
      third_quartile = ~quantile(.x, probs = 0.75, na.rm = TRUE), #The third quartile of x col
      sample_maximum = ~max(.x, na.rm = TRUE), #The sample maximum of x col
      median_abs_deviation = ~mad(.x, na.rm = TRUE), #The median absolute deviation of x col
      mean = ~mean(x, na.rm = TRUE), #The mean of x col
      std = ~sd(x, na.rm = TRUE)), #Standard deviation of x col
      .names = "{.col}.{.fn}")#Controls the names for the output
    ) 

summary(diamonds)
