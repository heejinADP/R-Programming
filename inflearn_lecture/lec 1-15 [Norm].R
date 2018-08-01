#normal dist. mean=80, sd=10
x <- seq(40,120, length=300)
#seq -> range / length -> 개수
normX <- dnorm(x, mean=80, sd=10)
normX
plot(x)
plot(normX)
plot(x,normX, type="l", col="red")
lines(x, dnorm(x, mean=80, sd=20), col="blue")

# y축은 정규분포확률밀도함수값 / Z-value or Z-score는 평균값이 0이고 편차가 1인 확률 변수
# z-score = 모집단 데이터 X - 모집단 평균 / 모집단 편ㅊ
# 정규분포는 매개변수(평균, 표준편차)를 사용한다. 
# 평균은 Medium(중간), 표준편차는 분포도 / 편차가 커질수록 분포가 넓어진다.
# 모집단의 평균은 주로 Mu(μ), 표준편차는 Simga(σ)로 표현한다.

#Quiz

#1. prob between 65-75
x2 <- seq(65, 75, length=200)
x2Norm <- dnorm(x2, mean=80, sd=10)
polygon(c(65, x2, 75), c(0, x2Norm, 0), col="gray")

pnorm # 이 안의 %(넓이)를 구함 ex) 0.5% (정규분포표)
qnorm # 넓이 안에서 x값을 리턴(%로 쪼개질때)
dnorm # 확률밀도함수값(f(x)값)을 구할때 / 일반적인 정규분포 그래프
rnorm # 난수발생 / random number(normal distribution)

p1<-pnorm(75, mean=80, sd=10)
p2<-pnorm(65, mean=80, sd=10)
answer<-p1-p2
print(answer)

#2. prob of over 92
pnorm(92, mean=80, sd=10)
#pnorm은 왼족부터 계산된다.
pnorm(92, mean=80, sd=10, lower.tail=FALSE)
#오른쪽으로 OR 확률의 합은 1
answer<-1-pnorm(92, mean=80, sd=10)

#3. prob of less than 68
answer<-pnorm(68, mean=80, sd=10)

#4. cutoff that seprates the bottm 30
qnorm(30, mean=80, sd=10)
#error -> (prob*, mean=, sd=)
answer<-qnorm(0.3, 80, 10)

#5. 80th percentile
answer<-qnorm(0.8, 80, 10)

#6. cutoffs that contain the middle 60%
answer1<-qnorm(0.8, 80, 10)
answer2<-qnorm(0.2, 80, 10)
