#Install and load the ggplot2 library
library(ggplot2)

#Import the diamonds dataset
data(diamonds)

#Use carat as size and price as cost
#Separate out cut grades
diamonds_aesthetics <- ggplot(data = diamonds,
                              mapping = aes(x = carat, 
                                            y = price, 
                                            color = cut)) + 
  geom_point(alpha = 0.4, size = 1.5) + #Reduced alpha and smaller data points
  geom_smooth(se = FALSE, method = "lm", linetype = "dashed") + #Smoother lines
  facet_wrap(~ cut, nrow = 2) +
  labs(x = "Carat",
       y = "Price",
       color = "Cut Grade", 
       title = "Diamonds Data Visualization") +
  theme_minimal() #Polished look of visualization

#Summarize the visualization
diamonds_aesthetics

