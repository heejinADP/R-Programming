# p112
library(ggplot2)

# Q1
install.packages("data.table")
library(data.table)
mpgCopy=copy(mpg)
mpgCopy

# Q2
names(mpg)
names(mpgCopy)=c("manufacturer","model","displ","year","cyl","trans","drv","city","highway","fl","class")
mpgCopy
