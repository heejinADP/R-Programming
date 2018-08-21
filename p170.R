# p170
library(ggplot2)
mpg
mpgcopy <- as.data.frame(ggplot2::mpg)
mpgcopy
mpgcopy[c(65, 124, 131, 153, 212), "hwy"] <- NA
mpgcopy$hwy

# Q1
?table
table(is.na(mpgcopy$hwy))

# Q2
library(dplyr)
mpgcopy %>% filter(is.na(hwy)==FALSE) %>% group_by(drv) %>% summarise(hwymean=mean(hwy))
?filter
?summarise
