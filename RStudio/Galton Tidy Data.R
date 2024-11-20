library(dplyr)
library(tidyr)
library(tidyverse)
library(dplyr)
library(googlesheets4)
#Question 13
galton_tidy_sheet <- read_sheet(
  ss = 'https://docs.google.com/spreadsheets/d/1Txj51UpLCgYR6nsh1kytBuwZm7agzVIK7feY8S0ZYrw/edit?usp=sharing'
)
galton_tidy <- galton_tidy_sheet %>%
  separate_wider_delim(
    cols = `Sons in order of height`,
    delim = ",",
    too_few = "align_start", 
    names = c("son1", "son2", "son3")
    ) %>%
  separate_wider_delim( 
    cols = `Daughters in order of height`,
    delim = ",",
    too_few = "align_start", 
    names = c("daughter1", "daughter2", "daughter3") 
    ) 

print(galton_tidy)
#Question 15
sheet_url <- "https://docs.google.com/spreadsheets/d/1Txj51UpLCgYR6nsh1kytBuwZm7agzVIK7feY8S0ZYrw/edit?gid=0#gid=0"
galtonFamily <- read_sheet(sheet_url)
colnames(galtonFamily)

galtonFamily <- galtonFamily %>%
  separate_wider_delim(`Sons in order of height`, sep = ",") %>%
  separate_rows(`Daughters in order of height`, sep = ",") %>%

#Question 17
galtonFamily <- read_sheet(
  ss <- "https://docs.google.com/spreadsheets/d/1Txj51UpLCgYR6nsh1kytBuwZm7agzVIK7feY8S0ZYrw/edit?gid=0#gid=0"
)

galton_tidy_sheet <- read_sheet(
  ss = 'https://docs.google.com/spreadsheets/d/1Txj51UpLCgYR6nsh1kytBuwZm7agzVIK7feY8S0ZYrw/edit?usp=sharing'
)
galton_tidy <- galton_tidy_sheet %>%
  separate_wider_delim(
    cols = `Sons in order of height`,
    delim = ",",
    too_few = "align_start", 
    names = c("son1", "son2", "son3")
  ) %>%
  separate_wider_delim( 
    cols = `Daughters in order of height`,
    delim = ",",
    too_few = "align_start", 
    names = c("daughter1", "daughter2", "daughter3") 
  ) 

person_case <- galton_tidy %>%
  mutate(
    Father = as.character(Father),  
    Mother = as.character(Mother)) %>%
  pivot_longer(
    cols = c(Father:daughter3),
    names_to = "part",  
    values_to = "height"  
  ) %>%
  mutate(height = as.numeric(height)) %>%
  select(family, part, height)
print(person_case)


BabyNames %>%
  group_by( "First" ) %>%
  summarise( votesReceived=n() )

Tmp <- group_by(BabyNames, year, sex ) %>%
  summarise( Tmp, totalBirths=sum(count))

Tmp <- group_by(BabyNames, year, sex) %>%
summarise( BabyNames, totalBirths=sum(count))

Tmp <- group_by(BabyNames, year, sex)
summarise( BabyNames, totalBirths=sum(count))