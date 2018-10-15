# p289
install.packages("plotly")
library(plotly)
library(ggplot2)

p=ggplot(mpg, aes(x=displ, y=hwy)) + geom_point()
p

ggplotly(p)
p=ggplot (diamonds, aes(x=cut, fill=clarity)) +geom_bar(position="dodge")
ggplotly(p)

# p293
install.packages("dygraphs")
library(dygraphs)

eco=economics
head(eco)

library(xts)
eco1=xts(eco$unemploy, order.by=eco$date)
eco1
?dygraph
dygraph(eco1) %>% dyRangeSelector()

eco_a=xts(eco$psavert, order.by=eco$date)
eco_b=xts(eco$unemploy/1000, order.by = eco$date)

eco2=cbind(eco_a, eco_b)
names(eco2)
eco2
class(eco2)
#eco2=rename(eco2, psavert="..1", unemploy="..2")
colnames(eco2) = c("psavert", "unemploy")
head(eco2)
dygraph(eco2) %>% dyRangeSelector()
