#strsplit
strsplit("qoqpiejeiofjpqwefjf", split="j")

#1 word split
strsplit("how are you?", split=" ")

#letter split -> list
a<-strsplit("how are you?", split="")
class(a)

#paste&collapse
paste(a[[1]], collapse="")


#reverse
reversed<-a[[1]][length(reversed):1]
reversed
paste(reversed, collapse="")

#make function
reverse_myf <- function(string){
  #reverse // length(vector) & nchar(string)
  #length(string)==1
  splitStr<-strsplit(string , split="")
  reversed<-splitStr[[1]][nchar(string):1]
  reversed
  paste(reversed, collapse="")
}
reverse_myf("how are you?")
reverse_myf("Hi, I'm HS, are you fine?")
length("how")

