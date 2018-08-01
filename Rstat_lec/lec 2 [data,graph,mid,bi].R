'''
2.2 표와 그래프
(1) 질적자료
예제 : 후보 A, B, C에 대해 2,800명이 투표한 결과 
A : 1520표, B : 770표, C: 510표
돗수 분포표 (frequency table)

R code
'''

a <- rep("A", 1520) ; a
b <- rep("B",770) ; b
c <- rep("C",510) ; c 
x <- c(a,b,c) ;x
table(x)
y <- as.matrix(table(x)) ;y
# 행으로 저장 / y[1,1]일 경우에는 A 1520만 출ㄹ
freq <- y[,1] ; freq
relative_freq <- freq/sum(y)
z <- cbind(freq, relative_freq) ;z

#파이 챠트 (pie chart)
x <- c(1520, 770, 510) ;x
lab <- c("A", "B", "B") ; lab
y <- round(x/sum(x)*100, digits=1) ; y
w <- paste(lab, "(",y,"%",")") ;w
pie(x, labels=w, main="파이챠트")


# 예제 : 30페이지로 이루어진 보고서에서 각 페이지당 오자의 개수

x <- c(1,1,1,3,0,0,1,1,1,0,2,2,0,0,0,1,2,1,2,0,0,1,6,4,3,3,1,2,4,0) ;x
length(x)

# table -> 개수
table(x)

# matrix
y <- as.matrix(table(x)) ;y

# 행으로
freq <- y[,1]; freq
sum(freq)
# 상대도수
rel_freq <- freq/sum(freq); rel_freq
# 누적도수
csum <- cumsum(freq); csum
# 누적상대도수
c_rel_freq <- csum/sum(freq) ; c_rel_freq
# cbind( )
z <- cbind(freq, rel_freq, csum, c_rel_freq) ;z


# 히스토그램 (histogram)
data()
#hist(자료명$카테고리)
faithful
hist(faithful$waiting)

# 줄기-잎 그림 (stem-and-leaf plot)

stem(faithful$waiting)


# 2.3 중심과 퍼짐 측도

data()
x <- stackloss$stack.loss ;x

mean(x)
#분산 -> (표본value-평균)^2의 모든 합 / n-1(df)
var(x)
sd(x)
# 100분위
quantile(x, c(0.1,0.25,0.5,0.95))
# fivenum -> ( min, Q1, Q2, Q3, max )
fivenum(x)
summary(x)
# 1.5IQR range를 조정가능 / 0IQR / default==1.5IQR
boxplot(x, range=1.0)


# 2.4 이변량 자료와 상관계수

x <- faithful$eruptions
y <- faithful$waiting
plot(x,y)
cor(x,y)