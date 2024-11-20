# 1. Load packages
library(palmerpenguins)
library(dplyr) #data manipulation
library(tidyverse)
library(kableExtra)

# 2. Import the penguins dataset
data("penguins")

# 3. Filter the dataset for Adelie penguins
# 4. Drop rows with null values
penguins_summary_table <- 
  penguins %>%
  drop_na(species, island, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g, sex, year) %>%
  filter(species == "Adelie") 

# 5. Fit the linear regression model
penguinModel <- lm(
  formula = body_mass_g ~ bill_length_mm + bill_depth_mm + flipper_length_mm + sex + island,
  data = penguins_summary_table
)

#Create a summary table 
penguinModelCoefficients <- summary(penguinModel)

#Format the table
penguinModelCoefficients$coefficients %>%
  round(3) %>%
  kable(caption = "Regressions Coefficients",
        col.names = c("Estimate", "Standard Dev. Error", "t value", "p-value"),
        align = c("l", rep("c", 6))) %>%
  kableExtra::kable_styling(bootstrap_options = c("striped", "hover", "condensed"))



