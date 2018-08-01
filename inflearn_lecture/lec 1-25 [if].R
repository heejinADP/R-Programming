# if
mtcars
aggregate(mtcars$mpg, by=list(mtcars$cyl), mean)

# 행- 열|, 행렬 가져오기 dataframe[행,열][행,열]
mean_by_cyl <- function(x) {
if(x==4) {
  mean(mtcars[which(mtcars$cyl==4),][,1])
} else if(x==6) {
  mean(mtcars[which(mtcars$cyl==6),][,1])
} else if(x==8) {
  mean(mtcars[which(mtcars$cyl==8),][,1])
} else {
  "Wrong num"
}
}
mean_by_cyl(8)

mean_by_cy2 <- function(x) {
  mean(mtcars[which(mtcars$cyl==x),][,1])
}

# print paste -> paste(variable, "string")
x <- 2
paste("number", x)
