A = matrix(c(3,1,8,2,1,0,2,3,-1), nrow=3) ; A


eigen(A)

#아이겐벡터: 선형 변환 후에도 고유 벡터/방향이 변하지 않는 벡터값
# 벡터는 방향과 속도 // 고유 벡터의 고윳값

ev = eigen(A)$values
evec = eigen(A)$vectors
ev
evec

evec%*%diag(ev)%*%solve(evec)

# 직교함수
# 벡터의 직교는 양 벡터의 값이 0도 가능, 양 벡터의 내적도 0
# 수직벡터는 양 벡터의 값이 0이 아니지만, 양 벡터 내적이 0

