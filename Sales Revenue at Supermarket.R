library(tidyverse)
library(lubridate)
library(ggtext)

s<- supermarket_sales_Sheet1

str(d$Date)         

d %>% 
  mutate(year = year(Date),
         month = month(Date),
         day = day(Date)) %>%  
  select(month, `gross income`, `Product line`, Gender, Payment) %>% 
  group_by(`Product line`)  %>% 
  arrange(desc(month))  %>% 
  summarise(total_revenue = sum(`gross income`)) %>%  
  ggplot(aes( `Product line`,total_revenue))+
  geom_bar(stat = "identity", width = 0.5, fill = "darkblue")+
  geom_richtext(aes(label = total_revenue, vjust = 0.29, hjust = 1.3))+
  labs(title = "Revenue from the Sales (in $)", x = "", y= "Revenue")+
  coord_flip()+
  theme_bw()+
  theme(
       axis.text = element_text(face = "bold"),
       axis.title = element_text(face = "bold"),
       plot.title = element_textbox(hjust =1)
  )






