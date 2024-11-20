# 1. Install and load the Palmerpenguins and ggplot2 R packages
library(palmerpenguins)
library(ggplot2)

# Import the patchwork package for separating into islands
library(patchwork)


# 2. Import the penguins data
data(penguins)

# 3. Create a scatterplot based on the penguin species
# 4. Separate out the flipper length on the x axis and the bill length on the y axis

#Plot for Biscoe Island
penguins_aesthetics_biscoe <- ggplot(data = penguins,
                                     mapping = aes(x = flipper_length_mm,
                                                   y = bill_length_mm,
                                                   color = species)) +
  geom_point(alpha = 0.6, size = 2) + #Different alpha and smaller data points for readability
  labs(x = "Flipper Length (mm)", #Changes x-axis header
       y = "Bill Length (mm)", #Changes y-axis header
       color = "Species",
       title = "Biscoe",
       face = "bold") +
  theme_minimal() + #Polished look of visualization
  theme(strip.text = element_text(colour = "black", size = 10, face = "bold")) +
  theme(axis.title.x = element_text(colour = "black", face = "bold"), #Bold x-axis label
        axis.title.y = element_text(colour = "black", face = "bold"), #Bold y-axis label
        plot.title = element_text(size = rel(2)), #Bold plot title
        legend.key = element_rect(fill = "white", colour = "black"), #Square around legene keys
        legend.title = element_text(face = "bold") 
  )

#Plot for Dream island
penguins_aesthetics_dream <- ggplot(data = penguins,
                                    mapping = aes(x = flipper_length_mm,
                                                  y = bill_length_mm,
                                                  color = species)) +
  geom_point(alpha = 0.6, size = 2) + #Different alpha and smaller data points for readability
  labs(x = "Flipper Length (mm)", #Changes x-axis header
       y = "Bill Length (mm)", #Changes y-axis header
       color = "Species",
       title = "Dream",
       face = "bold") +
  theme_minimal() + #Polished look of visualization
  theme(strip.text = element_text(colour = "black", size = 10, face = "bold")) +
  theme(axis.title.x = element_text(colour = "black", face = "bold"), #Bold x-axis label
        axis.title.y = element_text(colour = "black", face = "bold"), #Bold y-axis label
        plot.title = element_text(size = rel(2)), #Bold plot title
        legend.key = element_rect(fill = "white", colour = "black"), #Square around legene keys
        legend.title = element_text(face = "bold") #Bold legend title
  )
  
# Plot for Torgersen Island
penguins_aesthetics_torgersen <- ggplot(data = penguins,
                                        mapping = aes(x = flipper_length_mm,
                                                      y = bill_length_mm,
                                                      color = species)) +
  geom_point(alpha = 0.6, size = 2) + #Different alpha and smaller data points for readability
  labs(x = "Flipper Length (mm)", #Changes x-axis header
       y = "Bill Length (mm)", #Changes y-axis header
       color = "Species",
       title = "Torgersen",
       face = "bold") +
  theme_minimal() + #Polished look of visualization
  theme(strip.text = element_text(colour = "black", size = 10, face = "bold")) +
  theme(axis.title.x = element_text(colour = "black", face = "bold"), #Bold x-axis label
        axis.title.y = element_text(colour = "black", face = "bold"), #Bold y-axis label
        plot.title = element_text(size = rel(2)), #Bold plot title
        legend.key = element_rect(fill = "white", colour = "black"), #Square around legene keys
        legend.title = element_text(face = "bold") #Bold legend title
  )

# Combines the island plots with patchwork package
penguins_aesthetics <- (penguins_aesthetics_biscoe | penguins_aesthetics_dream) / penguins_aesthetics_torgersen

# 5. Summarize the data visualization
penguins_aesthetics
                                      