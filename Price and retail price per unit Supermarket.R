library(tidyverse)
library(lubridate)

s <- supermarket_sales_Sheet1

#Price per unit and retail price per unit

s %>% 
  select(`Product line`, `Unit price`, `Tax 5%`, Quantity) %>% 
  relocate(Quantity, .after = `Unit price`) %>% 
  mutate(price_per_unit = `Unit price`/Quantity,
         retail_price_per_unit = price_per_unit*5/100+price_per_unit)
