#dotchart
x <- 1:10
y <- x-1
# plot(y-x) / plot(y~x)
plot(y~x)

mtcars

# list 요소 가져오기 / $(category) / row.names(list) / labes= (label)
# font size -> cex
plot(mtcars$mpg)
dotchart(mtcars$mpg, labels=row.names(mtcars), cex=0.7)

# facetor method / what is factor? vector of int
carmpg <- mtcars[order(mtcars$mpg),]
carmpg$cyl <- factor(carmpg$cyl)
class(carmpg$cyl)
dotchart(carmpg$mpg, labels=row.names(carmpg), cex=0.7)

# list order
data <- c(1,2,3,4)
data[order()]

# color and designation / x, y축 / labels= / grups=, cex(textsize), color, main(title) / xlab
carmpg$color[carmpg$cyl==4] <- "blue"
carmpg$color[carmpg$cyl==6] <- "green"
carmpg$color[carmpg$cyl==8] <- "red"
dotchart(carmpg$mpg, labels=row.names(carmpg), groups=carmpg$cyl, cex=0.7, color=carmpg$color, main="Milage per Gallon per Engine Cylinder")
