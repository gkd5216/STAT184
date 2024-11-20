install.packages("janitor")
install.packages("knitr")
install.packages("kableExtra")
library(janitor)
library(knitr)
library(kableExtra)
library(dplyr) #Data manipulation
library(tidyverse) #Tidy Messy Data

transformed_armed_forces_sheet <- read_csv( #Imported tidy data of US Forces
  "/Users/giannadelorenzo/Downloads/STAT 184/OFFICIAL tidy Data US Forces - Sheet5.csv",
  col_names = TRUE,
  #col_types = NULL,
  na = c("", "NA")
  )

transformed_armed_forces_sheet$Count <- as.numeric(gsub("[^0-9]", "", transformed_armed_forces_sheet$Count)) #Filters the csv cells with "NA" together
transformed_armed_forces_sheet <- transformed_armed_forces_sheet %>%
  filter(!is.na(Count)
           
individual_transformed_armed_forces <- 
  transformed_armed_forces_sheet %>%
  uncount(Count) #Uncount from tidyr to expand rows for individual armed forces

males_armed_forces <-
  individual_transformed_armed_forces %>%
  filter(Sex == 'Male') %>%
  group_by(`Pay Grade`, `Service Branch`) %>%
  summarise(
    count = n(),
    .groups = 'drop')

females_armed_forces <-
  individual_transformed_armed_forces %>%
  filter(Sex == 'Female') %>%
  group_by(`Pay Grade`, `Service Branch`) %>%
  summarise(
    count = n(),
    .groups = 'drop')

males_table <-
  kable("html_table", caption = "Male Armed Forces by Pay Grade and Service Branch") %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))

females_table <-
  kable("html_table", caption = "Female Armed Forces by Pay Grade and Service Branch") %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))

print(males_table)
print(females_table)
