# p156~157
library(dplyr)
fuel = data.frame(fl=c("c","d","e","p","r"),
                  fuel_category=c("CNG","diesel","ethanol E85","premium","regular"),
                  price=c(2.35, 2.38, 2.11, 2.76, 2.22),
                  stringsAsFactors=F) ; fuel
class(fuel$fuel_category)

# factor type은 R에서 명목변수를 의미한다(카테고리: 남1,여2 등)
# 이러한 명목변수는 범주 level로 표시되며 범주화되지만, 연산이 불가능하다.

# Q1
fuel
mpgcopy=mpg
mpgcopy$fl
total=left_join(fuel, mpgcopy, by="fl")

# Q2
head(total)
?select
select(total, 2:3)
