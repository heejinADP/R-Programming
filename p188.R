# p188
?geom_point()
library(dplyr)
library(ggplot2)

# Q1
mpgcopy= as.data.frame(ggplot2::mpg)
#geom_point(mpgcopy, aes("cty", "hwy"))
ggplot(mpgcopy, aes(cty, hwy))+geom_point()

# Q2
ggplot(midwest, aes(poptotal, popasian)) +
  geom_point() +
  xlim(0,500000) +
  ylim(0,10000)