# %>%은 tidyR에서 지원하는 연결 연산자 / 왼쪽 함수의 내용을 오른쪽과 연결시킨다. (코드를 깔끔하게)

# ggivs
install.packages("ggvis")
library(ggvis)

mtcars

# attach -> 변수를 알아서 붙이는 기능
plot(mpg, wt)

# pipe line %>%
# layer_points() / layer_lines() / layer_bars() / layer_smooth() / overdraw %>%
mtcars %>% ggvis ( ~mpg, ~wt) %>% layer_points() %>% layer_smooths() 

# color (fill:="color") / 변수추가 (fill= ~카테고리)
mtcars %>% ggvis ( ~mpg, ~wt, fill= ~cyl) %>% layer_points() %>% layer_smooths()

str(mtcars)
# num -> numeric(연속형) <-> facetor(요소)

# 타입 변환
mtcars$cyl <- factor(mtcars$cyl)
str(mtcars)

# 그래프 격자 추가 %>% add_axis("x or y", title="", values=c(int:int) / subdivide =수치: 수치를 기준으로 격자형 표시)
mtcars %>% 
  ggvis( ~mpg, ~wt, fill= ~cyl) %>% 
  layer_points() %>% layer_smooths() %>% 
  add_axis("x", title="MPG", values=c(10:35)) %>% 
  add_axis("y", title="WT", subdivide=4)
