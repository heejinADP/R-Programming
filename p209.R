# foreign 패키지
install.packages("foreign")

library(foreign)
library(dplyr)
library(ggplot2)
library(readx1)

raw_welfare <- read.spss(file="D:/R Programming/Koweps_hpc10_2015_beta1.sav",
                         to.data.frame = T)
welfare=raw_welfare
head(welfare)
summary(welfare)

# 재지정
welfare=rename(welfare, sex=h10_g3, year=h10_g4, marriage=h10_g10, religion=h10_g11,
       salary=p1002_8aq1, jobcode=h10_eco9, areacode=h10_reg7)

# 데이터 확인
class(welfare$sex)
table(welfare$sex)

# 결측치(==9) 제거
welfare$sex=ifelse(welfare$sex==9, NA, welfare$sex)
table(is.na(welfare$sex))

# 성별 이름 (male<-1, female<-2)
welfare$sex=ifelse(welfare$sex==1, "male", "female")
table(welfare$sex)

# qplot
qplot(welfare$sex)

class(welfare$salary)
summary(welfare$salary)
qplot(welfare$salary) + xlim(0, 1000)

# 이상치 처리
welfare$salary=ifelse(welfare$salary %in% c(0,9999), NA, welfare$salary)
summary(welfare$salary)
table(is.na(welfare$salary))

# 성별에 따른 월급 차이 분석하기
sex_income = welfare %>% filter(!is.na(salary)) %>% group_by(sex) %>% summarise(mean_salary=mean(salary))
sex_income

# 그래프
ggplot(sex_income, aes(x=sex, y=mean_salary)) + geom_col()

# 나이와 월급의 관계
class(welfare$year)
summary(welfare$year)
qplot(welfare$year)
table(is.na(welfare$year))
age1=ifelse(welfare$year==9999, NA, welfare$year)
age1
summary(age1)
welfare$age=2015-age1+1
summary(welfare$age)
qplot(welfare$age)

age_income=welfare %>% filter(!is.na(salary)) %>% 
  group_by(age) %>% summarise(mean_income=mean(salary))
head(age_income)

ggplot(age_income, aes(x=age, y=mean_income))+geom_line()

# 파생변수
welfare = welfare %>% mutate(agegroup=ifelse(age < 30, "young", ifelse(age<=59, "middle", "old")))

table(welfare$agegroup)
qplot(welfare$agegroup)

agegroup_income = welfare %>% filter(!is.na(salary)) %>% 
  group_by(agegroup) %>% summarise(salary_income=mean(salary))

ggplot(data=agegroup_income, aes(x=agegroup, y=salary_income))+geom_col()+
  scale_x_discrete(limits=c("young","middle","old"))

sex_income = welfare %>% filter(!is.na(salary)) %>% 
  group_by(agegroup, sex) %>% 
  summarise(age_sex_income=mean(salary))

sex_income
ggplot(sex_income, aes(x=sex, y=age_sex_income, z=agegroup)) + geom_map()
