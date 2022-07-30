library(tidyverse)
library(lubridate)

s <- supermarket_sales_Sheet1

class(s$Date)

s %>% 
  select(Gender, `Product line`, Payment) %>% 
  group_by(Gender) %>% 
  summarise(Payment) %>% 
  count(Payment) %>% 
  pivot_wider(names_from = Payment, values_from = n)
