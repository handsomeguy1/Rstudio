library(tidyverse)
library(ggtext)
d <- diamonds

d %>% 
  select(cut, price) %>% 
  group_by(cut)%>% 
 summarise(cut,price = sum(price)) %>% 
  count(cut, price) %>% 
  ggplot(aes(cut, price, fill = cut))+
  geom_bar(stat = "identity", position = "dodge", width = 1)+
  geom_richtext(aes(label = price, vjust=-0.1, fontface ="bold"))+
  labs(title = "Diamond Prices ($) by the Cut", y = "Price in $", x = "Cut")+
  scale_fill_discrete(guide = "none")+
  theme_bw()+
  theme(
       axis.text.y = element_blank(),
       axis.text.x = element_text(face = "bold"),
       axis.title.y = element_text(face="bold"),
       axis.title.x = element_text(face = "bold"),
       plot.title = element_text(face="bold", hjust = 0.5),
       panel.grid = element_blank()
  )

  