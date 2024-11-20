# 1. Load dplyr, dcData, and ggplot2 packages
library(devtools)
library(dcData)
library(dplyr)
library(ggplot2)

# 2. Load the BabyNames dataset
data("BabyNames")

# 3. Filter for the set of names
baby_names <- c("Linda", "David", "John", "Elizabeth", "Grace")
baby_names_filtered <- BabyNames %>%
  filter(name %in% baby_names) %>% #Filters the dataset by the chosen baby names
  select(name, sex, count, year) #Selects columns from BabyNames dataset

aggregated_data <- baby_names_filtered %>%
  group_by(name, year) %>% #Groups by the name and year
  summarize(Total_Count = sum(count), #Gets the sum of the count of names
            .groups = 'drop')

# 4. Create a line plot using ggplot2 containing the count over year with each name as a line
# 5. Rename the columns and plot title while polishing the visualization
ggplot(aggregated_data, aes(x = year,
                            y = Total_Count,
                            group = name,
                            color = name,
                            linetype = name)) +
  geom_line(alpha = 0.5) + #Different alpha and data points for readability
  ylab("Popularity") + #Renamed the y-axis header
  xlab("Year") + #Renamed the x-axis header
  labs(
    title = "The Popularity of a Set of Names Over Time",
    color = "Name", #Capitalized legend title for the color
    linetype = "Name" #Capitalized legend title for the line type
    ) +
  scale_color_manual(values = c("Linda" = "black", #Linda's line is black
                                "David" = "red", #David's line is red
                                "John" = "blue", #John's line is blue
                                "Elizabeth" = "purple", #Elizabeth's line is purple
                                "Grace" = "orange")) + #Grace's line is orange
  theme_minimal() + #Polished look of visualization
  theme(axis.title.x = element_text(colour = "black", face = "bold"), #Bold x-axis label
        axis.title.y = element_text(colour = "black", face = "bold"), #Bold y-axis label
        plot.title = element_text(face = "bold"), #Bold plot title
        legend.title = element_text(face = "bold")) #Bold legend title


