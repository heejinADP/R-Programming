# p133
install.packages("dplyr")
library(dplyr)

# Q1
mpgNew=mpg
?filter
head(mpg)

cyl4=mpgNew %>% filter (displ<=4.0)
mean(cyl4$highway) #25.96319

cyl5=mpgNew %>% filter (displ>=5.0)
mean(cyl5$highway) #18.07895

# Q2
audi=mpgNew %>% filter(manufacturer=="audi")
mean(audi$city) #17.6111
toyota=mpgNew %>%  filter(manufacturer=="toyota")
mean(toyota$city) #18.52941

# Q3
hwy=mpgNew %>% filter(manufacturer=="chevrolet"|manufacturer=="ford"|manufacturer=="honda")
mean(hwy$highway) #22.50943
