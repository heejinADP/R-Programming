# line plot, type, plot type
x <- c(1:10)
y <- x^2+10
# 기본형
plot(x,y, type="p")
# none
plot(x,y, type="n")
# 선 연결
plot(x,y, type="b")
# 계단식
plot(x,y, type="S")
# 세로줄
plot(x,y, type="h")

# 플롯 개수
par(mfrow=c(2,4))

for (i in 1:8) {
  plot(x,y, type="p", col="blue", pch=i)
}

# type
types=c("p", "l", "o", "b", "C", "S", "s", "h")
for (i in 1:8) {
  plot(x,y, type=types[i], col="blue", pch=i)
}