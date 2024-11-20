install.packages("Stat2Data")
library(ggplot2)
library(Stat2Data)

data(Election08)

ggplot(Election08, aes(x = Income)) +
  geom_boxplot()

data("Houses")
ggplot(Houses, aes(x = Size, 
                       y = Price)) +
  geom_boxplot()
