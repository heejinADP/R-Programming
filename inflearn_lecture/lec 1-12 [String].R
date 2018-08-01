x<- "what is your name?"
x<- "what's your name"
# ' use
x

y <- character()
y2 <-""
class(y2)
class(y)
length(y)
length(y2)

# "" is not inialization in R , length=1 // character(int) function

y <- c("e","12","2")
y

y <- character(10)
y[3] <- "third"
y
y[12] <- "twelveth"
y
 # add twelveth, eleventh is NA(missing value)

y[11] <- "eleventh"
y

n=3
m="3"
is.character(n)
class(m)
# is. / class method / when makes function, use (if condition)
as.character(n)
# as.method -> type change / needs variable
typeChangeN=as.character(n)
class(typeChangeN)

t <- c(1:5)
t2 <- c(1:5, "a")
t2
#list add -> (1:5, ~) // int + str -> str
t3 <- c(1:4, TRUE, FALSE)
t3
class(t3)
# TRUE, FALSE -> 0, 1 (INT)
t4 <- c(1:4, TRUE, FALSE, "A")
t4

df1 <- data.frame(n=c(1:4,"str"), letters=c("a","b","23","1","4"))
# data.frame(same legnth list1, same legnth list2)
str(df1)
df1
# str(date frame) -> structure print