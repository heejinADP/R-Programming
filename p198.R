# p198
library(dplyr)
library(ggplot2)

# Q1
mpgcopy=mpg
new=mpgcopy %>% filter(class=="compact"|class=="subcompact"|class=="suv") %>% 
  group_by(class)
ggplot(new, aes(class, cty))+geom_boxplot()
