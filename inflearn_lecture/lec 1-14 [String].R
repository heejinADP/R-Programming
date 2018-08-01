mtcars

cars<-rownames(mtcars)
cars2 <- colnames(mtcars)
cars

nchar(cars)
# rownames (row name list)
# nchar (length by element)

which(nchar(cars)==max(nchar(cars)))
cars[16]

grep("rd", cars, value=TRUE)
grep("[Vv]", cars, value=TRUE)
#pick up certain char or list // [more than two char]
grep("toyota", tolower(cars), value=TRUE)

library(stringr)
# library() lib import
cars
str_count(toupper(cars), "TOYOTA")
#str_count(list, "") -> count // 