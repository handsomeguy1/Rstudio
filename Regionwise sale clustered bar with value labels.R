rm(list = ls())
graphics.off()

library(tidyverse)
library(lubridate)
library(ggtext)

s<-superstore
 s1<-s %>% 
  select(Region, Sales, Category) %>% 
  mutate(Sales = round(Sales)) %>% 
  group_by(Category, Region) %>% 
  summarise(Sales = round(sum(Sales))) %>% 
  ggplot(aes(Region, Sales, fill = Category))+
  geom_bar(stat = "identity", position = "dodge")+
  geom_richtext(aes(label = Sales), parse = F, check_overlap = T, position = position_dodge(width = 1), vjust = -0.3,
                fontface = "bold", size = 4) +
   labs(title = "Regionwise Sales by Category of Goods")+
   scale_fill_discrete(name = "Goods Category")+
    theme(
         axis.text.y = element_blank(),
         plot.title = element_text(face = "bold", hjust = 0.5),
         axis.title.y = element_text(face="bold"),
         axis.title.x = element_text(face = "bold"),
         axis.text.x = element_text(face = "bold"),
         legend.title = element_text(face = "bold"),
         panel.background = element_rect(fill = "white"),
         panel.grid = element_blank(),
         plot.background = element_rect(fill = "white"),
         legend.background = element_rect(fill = "white"),
         legend.text = element_text(color =  "black", face = "bold")
                           )
 
ggsave(s1, filename = "plot.jpeg", height = 8, width = 11, units = c("in"), dpi = 300)
  



