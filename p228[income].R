library(dplyr)
library(ggplot2)
install.packages("readxl")
library(readxl)

# p228
head(welfare)
names(welfare)
#welf=rename(welfare, sex=h10_g3, year=h10_g4, marriage=h10_g10, religion=h10_g11,
               #salary=p1002_8aq1, jobcode=h10_eco9, areacode=h10_reg7)
welfare$agegroup
sex_income = welfare %>% filter(!is.na(salary)) %>% group_by(agegroup, sex) %>% 
  summarise(mean_income=mean(salary))
sex_income

ggplot(data=sex_income, aes(x=agegroup, y=mean_income, fill=sex)) + geom_col(position="dodge") +
  scale_x_discrete(limit=c("young", "middle", "old"))

sex_age <- welfare %>% filter(!is.na(salary)) %>% group_by(age, sex) %>% 
  summarise(mean_income=mean(salary))
sex_age
ggplot(sex_age, aes(age, mean_income, col=sex)) + geom_line()

# p233
class(welfare$jobcode)
table(welfare$jobcode)
list_job=read_excel("D:/R programming/Koweps_Codebook.xlsx", col_names=T, sheet=2)
head(list_job)
dim(list_job)
