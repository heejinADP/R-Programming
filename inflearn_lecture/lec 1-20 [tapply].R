# tapply
mtcars

# data class check / structure
class(mtcars)
str(mtcars)

# cut
newdata <- mtcars[1:2]
newdata

# $는 리스트 내 카테고리 접근
# which(조건) True값 소환
newdata$cyl==4
cyl_4 <- newdata[which(newdata$cyl==4),]
cyl_6 <- newdata[which(newdata$cyl==6),]
cyl_8 <- newdata[which(newdata$cyl==8),]

# mean
# cbind -> 벡터소환
cbind(mean(cyl_4$mpg), mean(cyl_6$mpg), mean(cyl_8$mpg))

# tapply(value, condition, 구하고 싶은 것)
tapply(newdata$mpg, newdata$cyl, mean)

# help: ?library
