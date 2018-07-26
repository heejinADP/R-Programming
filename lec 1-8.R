#file/choose()/hear(제목)
lungdata <- read.table(file.choose(), header=TRUE)
#error -> xls(지원X), -> txt

#top 6
head(lungdata)

#bottom 6
tail(lungdata)

lungdata2<-read.csv(file.choose(),hear=T)
head(lundata2)
#bug -> txt=table / csv=csv

#type check
str(lungdata2)

# $ is category in excel
max(lungdata2$Age)