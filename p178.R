# 178
library(dplyr)
mpgcopy <- as.data.frame(ggplot2::mpg)
mpgcopy[c(10,14,58,93), "drv"] <- "k"
mpgcopy[c(29,43,129,203), "cty"] <- c(3,4,39,42)
mpgcopy$cty

# Q1
table(mpgcopy$drv)
mpgcopy$drv = ifelse(mpgcopy$drv %in% c("4",'f','r'), mpgcopy$drv, NA)

# Q2
boxplot(mpgcopy$cty)$stats
quantile(mpgcopy$cty)
mpgcopy$cty = ifelse(mpgcopy$cty >= 9 & mpgcopy$cty <=26, mpgcopy$cty, NA)  
mpgcopy$cty
boxplot(mpgcopy$cty)$stats

# Q3
mpgcopy %>% filter(is.na(drv)==FALSE & is.na(cty)==FALSE) %>% group_by(drv) %>% 
  summarise(meanbydrv=mean(cty))
