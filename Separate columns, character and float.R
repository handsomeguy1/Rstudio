# splitting column with numerical data
x1
x <- X1
x %>% 
  separate(Data, into = c("before decimal", "after decimal"), convert = T) %>% 
  select(`after decimal`) 

#For character data, use 

separate(Data, into = c("first", "last"), sep = " ")
