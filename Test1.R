#install packages ## ** block -> ctrl+enter
install.packages("stringr") 
#string data / str_length(), str_sub()
install.packages("KoNLP") #Korean
install.packages("doBy") 
#data / summaryBy(), orderBy(), sampleBy()
install.packages("sqldf")
install.packages("plyr")
#data / adply(), ddply(), mdply() /merge, add, deduct
install.packages("reshape2")
#data / melt(), cast()

#*필수, 코드파일 실행 후 위의 package install block 설정 후, run(ctrl+enter)해주세요.
#그래도 한글이 깨질 경우,
#1. 파일 내의 library(package) - block 후에 ctrl+enter로 설치
#2. R studio - 상단 Tools - Global Options - Code - Saving - Default text encoding - Change - (UTF-8) 


# =======================================================
# 01. 다음과 같은 벡터 객체를 생성하시오.
# =======================================================

#조건1. Vec1 벡터 변수를 만들고, "R" 문자가 5회 반복되도록 하시오.
vec1 <- rep("R", 5)
vec1

#조건2. Vec2 벡터 변수에 1~10까지 3 간격으로 연속된 정수를 만드시오
vec2 <- seq(1, 10, by=3)
vec

#조건3. Vec3에는 1~10까지 3 간격으로 연속된 정수가 3회 반복되도록 만드시오.
vec3 <- rep(vec2, 3)
vec3

#조건4. Vec4에는 Vec2 ~ Vec3가 모두 포함되는 벡터를 만드시오
vec4 <- append(vec2, vec3)
vec4

#조건5. 25 ~ -15까지 5 간격으로 벡터 생성 (seq 사용)
vec5 <- seq(-15, 25, by=5)
vec5

#조건6. Vec4에서 홀수번째 값들만 선택하여 Vec5에 할당하시오
vec6 <- vec5[seq(1, length(vec5), by=2)]
vec6


# =======================================================
# 02. 다음과 같은 벡터를 칼럼으로 갖는 데이터프레임을 생성하시오
# =======================================================

# 다음---------------------------------------------------
name	<- c('최민수', '유관수', '이순신', '김유신', '홍길동')
age		<- c(55, 45, 45, 53, 15)
gender	<- c(1, 2, 1, 1, 1)
job		<- c('연예인', '주부', '군인', '직장인', '학생')
sat		<- c(3, 4, 2, 5, 5)
grade	<- c('C', 'C', 'A', 'D', 'A')
total	<- c(44.4, 28.5, 43.5, NA, 27.1)

#조건1. 위 7개의 벡터를 칼럼으로 갖는 user 데이터 프레임 생성
user <- data.frame(name, age, gender, job, sat, grade, total)
user

#조건2. gender 변수를 이용하여 히스토그램 그리기
hist(gender)


#조건3. user에서 짝수행만 선택해서 user2에 넣기
user2 <- user[seq(1, nrow(user), by=2)]
user2


# =======================================================
# 03. Data를 대상으로 apply()를 적용하여 행/열 방향으로 조건에 맞게 통계량을 구하시오.
# =======================================================
# 다음---------------------------------------------------
kor	<- c(90, 85, 90)
eng	<- c(70, 85, 75)
mat	<- c(86, 92, 88)

#조건1. 3개의 과목점수를 이용하여 데이터프레임(Data)를 생성한다.
data <- data.frame(kor,eng,mat)
data

#조건2. 행/열 방향으로 max()함수를 적용하여 최댓값 구하기
data$max <- apply(data, 1, max)
apply(data, 2, max)

#조건3. 행/열 방향으로 mean()함수를 적용하여 평균 구하기(소숫점 2자리 표현)
data$mean <- apply(data, 1, mean)
round(apply(data, 2, mean), 2)

#조건4. 행 단위 분산과 표준편차 구하기
apply(data, 2, sd)
apply(data, 2, var)

# =======================================================
# 04. 다음의 Data2 객체를 대상으로 정규표현식을 적용하여 문자열을 처리하시오.
# =======================================================
# 다음---------------------------------------------------
Data2 <- c('2017-02-05 수입3000원', '2017-02-06 수입4500원', '2017-02-07 수입2500원')
library(stringr)
Data2

#조건1. 일자별 수입을 다음과 같이 출력하시오.
str_extract_all(Data2, '[0-9]+원')


#조건2. 위 벡터에서 연속하여 2개 이상 나오는 모든 숫자를 제거하시오
str_replace_all(Data2, '[0-9][0-9]', '')


#조건3. 위 벡터에서 -를 /로 치환하시오
str_replace_all(Data2, '-', '/')

#조건4. 모든 원소를 쉼표(,)에 의해서 하나의 문자열로 합치시오
a <- strsplit(Data2, split = ',')
a
paste(a, collapse = "")

