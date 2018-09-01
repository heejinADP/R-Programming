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

# p244
welfare$religion
class(welfare$religion)
table(welfare$religion)

welfare$religion = ifelse(welfare$religion==1, "yes", "no")
table(welfare$religion)

class(welfare$marriage)
table(welfare$marriage)
welfare$group_marriage=ifelse(welfare$marriage==1, "marriage", ifelse(welfare$marriage==3, "divorce", NA))
table(welfare$group_marriage)
table(is.na(welfare$group_marriage))
qplot(welfare$group_marriage)

religion_marriage=welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  group_by(religion, group_marriage) %>% 
  summarise(n=n()) %>% mutate(tot_group=sum(n)) %>% mutate(pct=round(n/tot_group*100,1))

religion_marriage=welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  count(religion, group_marriage) %>% 
  group_by(religion) %>% 
  mutate(pct=round(n/sum(n)*100,2))

divorce = religion_marriage %>% 
  filter(group_marriage=="divorce") %>% 
  select(religion, pct)
divorce

ggplot(data=divorce, aes(x=religion, y=pct))+geom_col()

# p250
ageg_marriage = welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  group_by(agegroup, group_marriage) %>% 
  summarise(n=n()) %>% 
  mutate(tot_group=sum(n)) %>% 
  mutate(pct=round(n/tot_group*100, 1))
ageg_marriage

ageg_marriage = welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  count(agegroup, group_marriage) %>% 
  group_by(agegroup) %>% 
  mutate(pct=round(n/sum(n)*100, 1))
ageg_marriage

ageg_divorce=ageg_marriage %>% 
  filter(agegroup!="young" & group_marriage=="divorce") %>% 
  select(agegroup, pct)
ageg_divorce

ggplot(ageg_divorce, aes(agegroup, pct))+geom_col()

welfare$group_marriage
ageg_religion_marriage=welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  group_by(agegroup, religion, group_marriage) %>% 
  summarise(n=n()) %>% 
  mutate(tot_group=sum(n)) %>% 
  mutate(pct=round(n/tot_group*100,1))

ageg_religion_marriage
welfare$religion

ageg_religion_marriage=welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  count(agegroup, religion, group_marriage) %>%
  mutate(pct=round(n/sum(n)*100,1))
ageg_religion_marriage

df_divorce=ageg_religion_marriage %>% 
  filter(group_marriage=="divorce") %>% 
  select(agegroup, religion, pct)
df_divorce

ggplot(data=df_divorce, aes(agegroup, pct, fill=religion))+geom_col(position="dodge")

# p254
class(welfare$areacode)
table(welfare$areacode)
list_region = data.frame(code_region=c(1:7),
                         region=c("서울", 
                           "수도권(인천/경기)", 
                           "부산/경남/울산",
                           "대구/경북",
                           "대전/충남",
                           "강원/충북",
                           "광주/전남/전북/제주도"))
class(list_region$code_region)
list_region

welfare = rename(welfare, code_region=areacode)

welfare <- left_join(welfare, list_region, id="code_region")
welfare$region

region_ageg = welfare %>% group_by(region, agegroup) %>% 
  summarise(n=n()) %>% mutate(tot_group=sum(n)) %>% 
  mutate(pct=round(n/tot_group*100, 2))
head(region_ageg)

region_ageg=welfare %>% 
  count(region, agegroup) %>% 
  group_by(region) %>% 
  mutate(pct=round(n/sum(n)*100, 2))

region_ageg
ggplot(region_ageg, aes(region, pct, fill=agegroup)) + geom_col() + coord_flip()
