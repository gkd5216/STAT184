# 1. Load packages
library(ggplot2)
library(dplyr)

# 2. Import diamonds dataset
data("diamonds")

# 3. Group dataset by the type of cut
# 4. Summarize 10 statistics for the Length (x) attribute
# 5. Filter out empty values
diamonds_Table <- 
  diamonds %>%
  group_by(cut) %>%
  summarise(
    count = n(),
    minimum = min(x, na.rm = TRUE),
    first_quintile = quantile(x, 0.2, na.rm = TRUE),
    second_quintile = quantile(x, 0.4, na.rm = TRUE),
    median = median(x, na.rm = TRUE),
    third_quintile = quantile(x, 0.6, na.rm = TRUE),
    fourth_quintile = quantile(x, 0.8, na.rm = TRUE),
    maximum = max(x, na.rm = TRUE),
    arithmetic_mean = mean(x, na.rm = TRUE),
    arithmetic_sd = sd(x, na.rm = TRUE))

# 6. Format the diamonds table
diamonds_Table %>%
  kable(caption = "Diamonds Summary table",
        col.names = c("Cut", "Count", "Minimum", "First Quintile", 
                      "Second Quintile", "Median", "Third Quintile", 
                      "Fourth Quintile", "Maximum", "Arithmetic Mean", 
                      "Arithmetic Standard Dev."),
        align = c("l", rep("c", 10)) #Left align cut, right align numbers
        ) %>%
  kableExtra::kable_styling(bootstrap_options = c("striped", "hover", "condensed"),
                            full_width = FALSE, #Compact Table
                            ) %>%
  add_header_above(c(" " = 1, "Summary Statistics" = 10)) 

