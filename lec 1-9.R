# uniform distribution simulate

#random 개수 / ceiling = 올림함수

roll <- 10000
die<-ceiling(runif(roll)*6)

#table (categorization)
table(die)
b<-table(die)

#bar graph
barplot(b)


