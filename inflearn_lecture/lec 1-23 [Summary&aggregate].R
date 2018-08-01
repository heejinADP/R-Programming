# summary, aggregate 요약, 총계 패키지 설명
mtcars
install.packages("MASS")
library(MASS)
data(Aids2)
?Aids2

head(Aids2)

# 요약 / 카테고리별 수/넘버요약
summary(Aids2)

# 0세 데이터 뽑아보기
Aids2[which(Aids2$age==0),]

# alive people
Alive=Aids2[which(Aids2$status=="A"),]
Dead <- Aids2[which(Aids2$status=="D"),]

# aggregate(궁금한 것, by=기준, 값)
aggregate(Alive$age, by=list(Alive$sex), median)
aggregate(Dead$age, by=list(Dead$sex), median)
summary(Aids2)

# aggregate(by=list(A, B)) -> 기준 2개
aggregate(Aids2$age, by=list(Aids2$sex, Aids2$status), mean)
