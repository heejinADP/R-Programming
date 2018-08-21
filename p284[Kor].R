# p284
library(stringi)
install.packages("devtools")
library(devtools)
library(kormaps2014)
library(dplyr)
library(ggplot2)
library(ggiraphExtra)

devtools::install_github("cardiomoon/kormaps2014")

kor=korpop1
str(changeCode(korpop1))
names(kor)
kor= rename(kor, pop=총인구_명, name=행정구역별_읍면동)
kor
str(changeCode(kor))
ggChoropleth(kor, aes(fill=pop, map_id=code, tooltip=name), map=kormap1, interactive=T)

str(changeCode(tbc))
names(tbc)
ggChoropleth(tbc, aes(fill=NewPts, map_id=code, tooltip=name1), map=kormap1, interactive=T)
