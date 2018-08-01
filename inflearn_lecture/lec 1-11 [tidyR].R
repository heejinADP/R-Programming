# data cleansing / tidyr, dplyr

install.packages("tidyr")
library(tidyr)
install.packages("dplyr")
library(dplyr)
member<-data.frame(family=c(1,2,3), namef=c("a","b","c"), agef=c(30,40,23), 
                   namem=c("d","e","f"), agem=c(44,53,25))
member

#gather -> key값(열), value값(열)로 변  / gather(list, key(카테고리1), value(카테고리2), 기존1에서: 기존4까지)
a<-gather(member, key, value, namef:agem)

# separate -> 분리 / separate(list, 변환범주, c("new key", "new value"), 쪼갤 위치)
b<-separate(a, key, c("variable", "type"), -1)
a
b

# spread -> 생성 / spread(list, 카테고리, 카테고리)
new <- spread(b, variable, value)
new
select(member, family, namef, agef)

# pipe line %>%
new2 <- member %>%
  gather(key, value, namef:agem) %>%
  separate(key, c("variable", "type"), -1) %>%
  spread(variable, value)
new2

# gather() 보충
sales <- data.frame(
  person=c("John", "Mary", "Steve"),
  tv=c(2,1,3),
  cellphone=c(20,25,30),
  computer=c(4,4,4)
)
sales
salesGather<- gather(sales, item, quantity, tv:computer )
salesGather

# spread() <-> gather() : key를 행 / value를 행
salesSpread <- spread(salesGather, item, quantity)
salesSpread

# new class
install.packages("hflights")
library(hflights)
data(hflights)
a<-head(hflights)
a

# select() -> 범주 부분선택 / contains(""): 특정 문자열 포함 카테고리
# head는 상위 6개 / tail은 하위 6개
fly <- select(a, DepTime, ArrTime, FlightNum, contains("Time"))
fly

# filter() -> 조건
fly1 <- filter(a, Month==12, DayofMonth==25)
fly1
