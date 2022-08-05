library(tidyverse)
library(stringr)


m %>% 
  select(genus, order) %>% 
  filter(str_detect(genus,"^Ca")) %>% 
  filter(str_detect(order, "la")) %>% view()
         
          