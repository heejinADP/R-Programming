# p193
install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

# Q1
mpgcopy=mpg
suv=filter(mpgcopy, mpgcopy$class=="suv")
new=suv %>% group_by(manufacturer) %>% summarise(mean=mean(cty)) %>% arrange(desc(mean)) %>% head(5)
ggplot(new, aes(manufacturer, mean))+geom_col()

# Q2
num=mpgcopy %>% group_by(class) %>% summarise(classNum=n())
num
ggplot(num, aes(class, classNum))+geom_col()
