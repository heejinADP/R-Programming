#p265
install.packages("rJava")
install.packages("memoise")
install.packages("KoNLP")
install.packages("stringr")
install.packages("wordcloud")

library(KoNLP)
library(dplyr)
library(stringr)
library(wordcloud)
library(RColorBrewer)

# konlp 사ㅈ
useNIADic()

# 읽어오기
txt<-readLines("D:/R Programming/hiphop.txt")
txt

# 특문 제거
re<-str_replace_all(txt,"\\W"," ")
re

# 가장 많이 사용된 단어 알아보기
noun=extractNoun(re)
noun
nounTable=table(unlist(noun))
nounTable
df <- as.data.frame(nounTable, stringsAsFactors=F)
names(df)

# 변수재지정
df <- rename(df, word=Var1, freq=Freq)
class(df$word)

# 2글자 이상만 추출
df_f <- filter(df, nchar(word)>=2)
df_f
?nchar
# 상위 20
df_f %>% arrange(desc(freq)) %>% head(20)

# ㅅ
col=brewer.pal(8, "Dark2")
col
set.seed("1234")

wordcloud(words=df_f$word,
          freq=df_f$freq,
          min.freq=2,
          max.words=200,
          random.order=F,
          rot.per=.1,
          scale=c(4,0.3),
          colors=col)

# blue cloud
col2=brewer.pal(8, "Blues")
set.seed("1234")

wordcloud(words=df_f$word,
          freq=df_f$freq,
          min.freq=2,
          max.words=200,
          random.order=F,
          rot.per=.1,
          scale=c(4,0.3),
          colors=col2)
