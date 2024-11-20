library(dplyr) #Data manipulation
library(tidyr) #Tidy Messy Data

transformed_armed_forces_sheet <- read_csv( #Imported tidy data of US Forces
  "/Users/giannadelorenzo/Downloads/OFFICIAL tidy Data US Forces - Sheet5.csv",
  col_names = TRUE,
  col_types = NULL,
  na = c("", "NA") #Turns csv cells from "N/A*" to "N/A"
  )

transformed_armed_forces_sheet$Count <- as.numeric(gsub("[^0-9]", "", transformed_armed_forces_sheet$Count)) #Filters the csv cells with "NA" together

transformed_armed_forces_sheet <- transformed_armed_forces_sheet %>%
  filter(!is.na(Count) #Rids of the csv cells with NA)

grouped_transformed_armed_forces <- 
  transformed_armed_forces_sheet %>%
  group_by(`Pay Grade`, `Service Branch`, Sex) %>% #Data verb 'group_by' to group tidy columns
  summarise(group_of_soldiers = sum(Count, na.rm = TRUE)) #Used after 'group_by' to output two data frames, na.rm removes missing values

individual_transformed_armed_forces <- 
  transformed_armed_forces_sheet %>%
  uncount(Count) #Uncount from tidyr to expand rows for individual armed forces

print(grouped_transformed_armed_forces) #Case with group of soldiers
print(individual_transformed_armed_forces) #Case with individual soldiers
