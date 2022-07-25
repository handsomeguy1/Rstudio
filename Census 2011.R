c <- read.csv("E:/ggplot Udemy/Datasets/india_census_housing-hlpca-full.csv")
library(tidyverse)
library(ggtext)
c1 <- as.tibble(c)

c1 %>% 
  select(Area.Name, State.Name, Rural.Urban, District.Name, Total.Number.of.Dilapidated, 
         Total.Number.of.Livable, Total.Number.of.Good) %>% 
  filter(State.Name == "MAHARASHTRA", District.Name %in%c("Ahmadnagar", "Aurangabad", "Bid", "Pune", "Kolhapur", "Latur")) %>% 
  relocate(District.Name, .after = State.Name) %>% 
  group_by (District.Name,Rural.Urban) %>% 
  count(Total.Number.of.Good) %>% 
  pivot_wider(names_from = Rural.Urban, values_from = Total.Number.of.Good) %>% 
  relocate(Total, .after = Urban) %>% 
  ggplot(aes(District.Name, Total, fill = factor(Total)))+
  geom_bar(stat = "identity", width = 0.5)+
  coord_flip()+
  geom_richtext(aes(label = Total, hjust = 0.9, fontface = "bold"))+
  labs(title = "% of Good Households in Sample Districts",
       y = "Total no. of Good Households", x = "")+
  theme_bw()+
  theme(
      plot.title = element_text(face = "bold", hjust = 0.5),
      axis.text = element_text(face = "bold", size = 11),
      axis.title = element_text(face = "bold"),
      legend.position = "none"
  )


  