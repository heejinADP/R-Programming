'''
카이제곱검정: 표준정규확률 변수를 제곱한 다음 하나로 나타낸 것을 검정
카이제곱: 편차2을 구할 때 구하며, 두 변수간의 유의미한 상관관계를 검정할 때 쓰인다.
          즉, (row*column)의 각 셀에 두 변수의 결합빈도와 실제 측정값을 비교해서 관계를 비교한다.
'''

# Chi-square test
data<-matrix(c(42,30,50,87), nrow=2, byrow=FALSE)
data

# 귀무가설(H0): 차이가 없다. 기각을 통해 연구결과를 입증한다.
# (실제 - 예상치)^2 / 예상치 -> 카이제곱
chisq <- function(bs) {
  Expected <- outer(rowSums(bs), colSums(bs)) / sum(bs)
  sum((bs-Expected)^2/Expected)
}
data
chisq(data)

# row - sum / column - sum
rs <- rowSums(data)
cs <- colSums(data)
rs
cs
# rs * cs
outer(rs, cs)

# 카이제곱의 검증 -> p value (0.05 이하 등) / 1-p+method(카이제곱, 자유도(df))
chisq(data)
1-pchisq(chisq(data),1)


# method // correction Y/N
chisq.test(data)
chisq.test(data, correct=FALSE)
