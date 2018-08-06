# p144
library(dplyr)

# Q1
mpgcopy=mpg
head(mpgcopy)
mpgcopy = mpgcopy %>% mutate(totalmpg=city+highway)
mpgcopy$totalmpg

# Q2
mpgcopy = mpgcopy %>% mutate(avgmpg=totalmpg/2)

# Q3
mpgcopy %>% arrange(desc(avgmpg)) %>% head(3)

# Q4
mpgcopy2=mpg %>% mutate(totalmpg=city+highway) %>% mutate(avgmpg=totalmpg/2) %>% 
  arrange(desc(avgmpg)) %>% head(3)
mpgcopy2
