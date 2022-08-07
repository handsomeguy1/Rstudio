mtcars
# This function names an unnamed column. Usually first column is unnamed in some dataset.
library(tidyverse)

m <- mtcars
m
-m %>% 
  mutate (rownames_to_column(m, var = "car")) %>%
  relocate(car)
 
