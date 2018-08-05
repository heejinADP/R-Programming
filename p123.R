# p123
library(ggplot2)
midwest

# Q1
?midwest
head(midwest)
# midwest는 437행, 28컬럼(변수)로 이뤄진 데이터프레임 // 중서부 나라들의 인구학 정보

# Q2
install.packages("reshape")
library(reshape)
?reshape
midwest = rename(midwest, c(poptotal="total", popasian="asian"))
names(midwest)

# Q3
?aggregate
summary(midwest)
install.packages("readxl")
midwest$asianper=midwest$asian/midwest$total*100
hist(midwest$asianper)
# 외부파일 입력&저장
# read_excel / read.csv / write.csv(dtf, file="address") / save(df, file="address")

# Q4
midwest$test=ifelse(midwest$asianper > mean(midwest$asianper), "large", "small")
midwest$test

# Q5
table(midwest$test) # 평균값 정규분포가 small쪽으로 skewed돼있는 상황 -> 이상데이터(중간값과의 비교 필)
qplot(midwest$test)