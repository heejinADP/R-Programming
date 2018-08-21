# p150
library(dplyr)
?group_by()
?summarise()

# Q1&Q2
head(mpg)
mpgcopy = mpg
mpgcopy %>% group_by(class) %>% summarise(meanmpg=mean(city)) %>% arrange(desc(meanmpg))

# Q3
mpgcopy %>% group_by(manufacturer) %>% summarise(highmpg=mean(highway)) %>% 
  arrange(desc(highmpg)) %>% head(3)

# Q4
mpgcopy2 = mpg
mpgcopy2 %>% filter(class==compact)
summarise(mpgcopy2, n())
length(mpgcopy2) #length는 열의 개수 출력
