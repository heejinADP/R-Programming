# p195
library(dplyr)
library(ggplot2)
names(economics)

ggplot(economics, aes(date, psavert))+geom_line()
