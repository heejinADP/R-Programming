# p160
library(ggplot2)
library(dplyr)

# Q1
copy=midwest
names(copy)
# mutate는 지정 필요
copy= copy %>%  mutate(totalper=(total-popadults)/total*100)
head(copy$totalper)

# Q2
copy = copy %>% arrange(desc(copy$totalper))

# Q3
category = c("large","middle","small")
standard = c("above 40%", "30~40%", "below 40")
df = data.frame(category, standard)
df
copy$totalper
copynew1= copy %>% filter(totalper, totalper >= 40) %>% summarise(n())
copynew2= copy %>% filter(totalper, totalper >= 30 & totalper < 40) %>% summarise(n())
copynew3= copy %>% filter(totalper, totalper < 30) %>% summarise(n())
num=c(copynew1[[1]], copynew2[[1]], copynew3[[1]])
new=cbind(df,num)
new

# Q4
copy = midwest
copy %>% arrange(desc(asianper)) %>% tail(10) %>% select(state,county,asianper)
