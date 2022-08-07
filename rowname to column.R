mtcars

library(tidyverse)

m <- mtcars
m
-m %>% 
  mutate (rownames_to_column(m, var = "car")) %>%
  relocate(car)
 
