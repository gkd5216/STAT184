library(ggplot2)
library(psych)
data("diamonds")

dimensionStats2 <- describeBy(
  x + y + z ~ cut,
  data = diamonds,
  mat = TRUE,
  quant = c(0.25, 0.75)
) %>%
  mutate(
    vars = case_when(
      vars == 1 ~ "length (mm; x)",
      vars == 2 ~ "width (mm; y)",
      vars == 3 ~ "depth (mm; z)"
    )
  ) %>%
  dplyr::select(cut = group1, dimension = vars, count = n,
                min, Q1 = Q0.25, median, Q3 = Q0.75, max, mad, mean, sd)

"""
x+y+z means adding data frame x, data frame y, and data frame z together
~cut groups columns x,y,z by cut
mat = TRUE provides a matrix output instead of a list


"""

print(dimensionStats2)
