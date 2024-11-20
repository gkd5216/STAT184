library(tidyverse)

cleanedHypoxia <-- hypoxiaRaw %<%
  rename(
    junk = V1
    Altitude = V2
    Air_Pressure_mmHg = V5
  )

# In x|> f |> g, applies f to x, then to f(x), going to apply g

[1] "country" "area" "pop" "growth" "birth" "death"
dim(CountryData_sub)
data("MigrationFlows")
MigrationFlows2000 = MigrationFlows[,1:4]
head(MigrationFlows2000)

#CountryData_sub (name)
#MigrationFlows2000 (code)
#Columns: sex, destcode, origincode, Y2000

LeftTable %>%
  joinOperation(RightTable, vars_for_matching)

#We can join the JoinedData1 data to the MigrationFlows2000 data

JoinedData1 %>%
  right_join(MigrationFlows2000, by = c("iso_a3" = "origincode"))

#################################

html_eg <- minimal_html("
  <p>This is a paragraph</p>
  <ul>
    <li>This is a bulleted list</li>
  <ul>                      
")

library(rvest)
library(tidyverse)