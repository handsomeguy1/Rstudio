library(tidyverse)
library(stringr)


m %>% 
  select(genus, order) %>% 
  filter(str_detect(genus,"^Ca")) %>% 
  filter(str_detect(order, "la")) %>% view()
 
# Tried a more simplified code for the same

m %>% 
  select(genus, order) %>%
  filter(str_detect(genus,"^Ca") & str_detect (order,"ia$"))
          