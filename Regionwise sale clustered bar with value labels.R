rm(list = ls())
graphics.off()

library(tidyverse)
library(lubridate)
library(ggtext)

s<-superstore
 s %>% 
  select(Region, Sales, Category) %>% 
  group_by(Category, Region) %>% 
  summarise(Sales = round(sum(Sales)))%>% 
  ggplot(aes(Region, Sales, fill = Category))+
  geom_bar(stat = "identity", position = "dodge")+
  geom_richtext(aes(label = Sales), parse = F, check_overlap = T, position = position_dodge(width = 1), vjust = -0.3,
                fontface = "bold", size = 4)

ggsave(s1, filename = "plot.jpeg", height = 6, width = 14, units = c("in"), dpi = 300)
  



