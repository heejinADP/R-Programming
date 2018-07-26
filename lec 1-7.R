#data frame -> cable
name <- c('john', 'jaehee', 'juliet', 'james')
sex <- c('f','f','f','m')
occup <- c('althele','doctor','ceo','analyst')
age <- c(40,35,43,29)

#should be same with len(each of list)

#framework
member<-data.frame(name,age,sex,occup)
member
name[3]
member[1]
#data frame -> array [[a],
#                     [b],
#                    [c],
#                    [d] ]

member[2,4]
# python처럼 member[2][4]가 아닌 member[2,4]

#edit value
member[1,3]<-'m'
member
