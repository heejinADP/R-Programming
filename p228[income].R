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
welfare=rename(welfare, code_job=jobcode)
welfare=left_join(welfare, list_job, id="code_job")

welfare %>% 
  filter(!is.na(code_job)) %>% select(code_job, job) %>% 
head(10)

job_income = welfare %>% filter(!is.na(job) & !is.na(salary)) %>% group_by(job) %>% 
  summarise(mean_income=mean(salary))
head(job_income)

top10 = job_income %>% arrange(desc(mean_income)) %>% head(10)
top10

ggplot(top10, aes(x=reorder(job, mean_income), y= mean_income))+geom_col()+coord_flip()

bottom10 = job_income %>% arrange(mean_income) %>% head(10)
bottom10

ggplot(bottom10, aes(reorder(job, mean_income), mean_income))+geom_col()+coord_flip()+ylim(0,850)

welfare$job
# p240
job_male=welfare %>% filter(!is.na(job) & sex=="male") %>%
  group_by(job) %>% summarise(n=n()) %>% arrange(desc(n)) %>% head(10)
job_male

job_female=welfare %>% filter(!is.na(job) & sex=="female") %>% 
  group_by(job) %>% summarise(n=n()) %>% arrange(desc(n)) %>% head(10)
job_female

ggplot(data=job_male, aes(x=reorder(job, n), y=n)) +
         geom_col()+coord_flip()
ggplot(data=job_female, aes(x=reorder(job, n), y=n)) + geom_col() + coord_flip()
