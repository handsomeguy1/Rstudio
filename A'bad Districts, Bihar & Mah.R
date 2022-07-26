library(tidyverse)
library(ggtext)
rm(c1, c2)
c <- as.tibble(c)

c %>% 
  select(State.Name, District.Name, Area.Name, Material_Floor_Mud, Rural.Urban) %>% 
  filter(State.Name %in% c("MAHARASHTRA", "BIHAR") & District.Name == "Aurangabad" & Rural.Urban !="Total") %>% 
  relocate(Rural.Urban, .before = Material_Floor_Mud) %>% 
 ggplot(aes(State.Name, Material_Floor_Mud, fill = Rural.Urban))+
  geom_bar(stat = "identity", width = 0.5)+
  labs(x="", y="Houses with Mud Flooring", title = "Aurangabad Districts: Bihar & Maharashtra")+
  scale_fill_discrete(name = "Rural.Urban")+
  geom_richtext(aes(label = Material_Floor_Mud, fontface = "bold", vjust = 1))+
  theme_classic()

