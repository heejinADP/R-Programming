#lec1-6
x <- c(1,22,3,5,4,5,565,-7,343,-9,979,-97,342,23,1,1,35,45,6,7,8,
       7,3,35,5,3,35,3,535,213,2,23,4,4,3,53,53,5)

x>5
# comparator in all eliments of list!

sum(x>100)
#==6, unintended error, True's num

sum(x[x>100])
# [condition] 만족하는 모든 수를 가지고 오는 것

which(x>100)
# condition의 index

