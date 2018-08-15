# p273
#install.packages("rJava")
library(dplyr)
library(stringr)
library(rJava)
library(KoNLP)
library(ggplot2)
library(wordcloud)

# csv 불러오기
txt <- read.csv("D:/R Programming/twitter.csv",
                header=T,
                fileEncoding="utf-8",
                stringsAsFactors=F)
txt

# 변수명 변경
names(txt)
txtr=rename(txt, num=번호, name=계정이름, date=작성일, comment=내용)

# 특문 제거
txtr$comment=str_replace_all(txtr$comment, "\\W", " ")
head(txtr$comment)

# 명사추출
noun = extractNoun(txtr$comment)
list = table(unlist(noun))
class(list)

df = as.data.frame(list, stringsAsFactors = F)
head(df)
names(df)
df = rename(df, word=Var1, freq=Freq)
class(df$word)
df_word = df %>% filter(nchar(word) >= 2)

# 상위 20위
top20 = df_word %>% arrange(desc(freq)) %>% head(20)
top20

order= arrange(top20, freq)$word

ggplot(data=top20, aes(x= word, y=freq)) +
  ylim(0, 2500)+
  geom_col() +
  coord_flip() +
  scale_x_discrete(limit=order)+
  geom_text(aes(label=freq),hjust=-0.3)

col=brewer.pal(8, "Dark2")
set.seed("1234")

wordcloud(words=df$word,
          freq=df$freq,
          min.freq=2,
          max.words=200,
          random.order=F,
          rot.per=.1,
          scale=c(8,0,7),
          colors=col)
