i<-read.csv("E:/ggplot Udemy/Datasets/IPL Matches 2008-2020.csv")

library(tidyverse)
library(lubridate)

i %>% 
  select(-method, - eliminator, - umpire1,- umpire2,- neutral_venue, 
         winner, toss_decision, toss_winner, result_margin, result, venue) %>%
  drop_na(result) %>% 
  mutate(win_margin = ifelse(result_margin>50, "big", "small")) %>%
  drop_na(win_margin) %>% 
  relocate(win_margin, .after = winner) %>% 
  ggplot(aes(win_margin))+
  geom_bar(aes(fill = result), width = 0.5)+
  labs (title = "IPL (2008-2020) Win Margin by Result", y="Win Margin")+
  scale_y_continuous(limits = c(0,900))+
  coord_polar()+
  theme_bw()+
  theme(
    axis.title.x = element_blank()
  )
