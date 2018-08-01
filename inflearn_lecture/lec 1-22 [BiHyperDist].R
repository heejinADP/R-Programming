# binomial, hypergeometric distribution

# dbinom(성공횟수, 전체, 독립된 확률)
dbinom(3, 10, 0.4)

# dhyper(성공확률, sample size, not 전체 size, 뽑는 전체)
# for(i in ~): 샘플사이즈가 증가하면 초기하분포가 이항분포와 비슷해진다.
# list <- type(length)
a=100
apprax <- numeric(length=a)
for(i in 1:a) {
  apprax[i]=dhyper(3, 4*i, 6*i, 10)
}
apprax

plot(apprax[2:100])

#abline : plot내에 추가하는 선
abline (h=dbinom(3, 10, 0.4), col="red")

a <- c(1,2,3)
a[1]
a[[1]]
string <- "abcdefghijklmnop"
library(stringr)
a <- strsplit(string, split="h")
a
a[1]

a <- c(1,2,3)