# normal distribution simulate

#random 개수 / ceiling = 올림함수

roll <- 1000000
dice1<-ceiling(runif(roll)*6)
dice2<-ceiling(runif(roll)*6)
dice3<-ceiling(runif(roll)*6)

#table (categorization)
table(dice1+dice2+dice3)
b<-table(dice1+dice2+dice3)

#bar graph
barplot(b)

# Export=graph save

b[1]*6-b[6]
b[11]*6

