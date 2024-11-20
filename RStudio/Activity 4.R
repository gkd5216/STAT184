library(readxl)
tidied_data <- read_excel(
  "/Users/giannadelorenzo/Downloads/STAT 184 Galton Data.xlsx",
  col_names = TRUE
  )
untidied_data <- read_excel(
  "/Users/giannadelorenzo/Downloads/Copy of US Armed Forces (6_2024).xlsx",
  col_names = TRUE
)
colnames(untidied_data)


library(tidyr)
library(dplyr)
library(tidyverse)
library(readr)

data <- read.csv("/Users/giannadelorenzo/Downloads/Tidied Data US Forces - Sheet1.csv")
head(data)
data <- read.csv("/Users/giannadelorenzo/Downloads/Tidied Data US Forces - Sheet1.csv", skip = 1, header = TRUE)
colnames(data) <- c("Pay_Grade", paste(rep(c("Army", "Navy", "Marine_Corps", "Air_Force", "Space_Force", "Total"), each = 3), rep(c("Male", "Female", "Total"), times = 6), sep = "_"))
tidy_data <- data %>%
  pivot_longer(
    cols = -Pay_Grade,
    names_to = c("Service_Branch", "Gender"),
    names_sep = "_",
    values_to = "Count"
  ) %>%
  filter(Service_Branch != "Total")
print(tidy_data)
armed_forces <- read_csv(
  "/Users/giannadelorenzo/Downloads/Tidied Data US Forces - Sheet1.csv",
  col_names = TRUE,
  col_types = NULL,
  col_select = NULL,
  id = NULL,
  locale = default_locale(),
  na = c("", "NA"),
  quoted_na = TRUE,
  quote = "\"",
  comment = "",
  trim_ws = TRUE,
  skip = 0,
  name_repair = "unique",
  num_threads = readr_threads(),
  progress = show_progress(),
  show_col_types = should_show_types(),
  skip_empty_rows = TRUE,
  lazy = should_read_lazy()
)
colnames(armed_forces)

str(armed_forces)
head(armed_forces)


tidy_data <- armed_forces %>%
  pivot_longer(
    cols = -Service_Branch,  
    names_to = c("Pay_Grade", "Gender"),
    names_sep = "_",  
    values_to = "Count"
  )
print(tidy_data)
