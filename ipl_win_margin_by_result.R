i<-read.csv("E:/ggplot Udemy/Datasets/IPL Matches 2008-2020.csv")

library(tidyverse)
library(lubridate)

i %>% 
  select(-method, - eliminator, - umpire1,- umpire2,- neutral_venue, 
         winner, toss_decision, toss_winner, result_margin, result, venue) %>% 
  mutate(win_margin = ifelse(result_margin>50, "big", "small")) %>% 
relocate(win_margin, .after = winner) %>% 
  ggplot(aes(win_margin))+
  geom_bar(aes(fill = result))



