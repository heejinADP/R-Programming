# word by word
rev_word <- function(string) {
  a <- strsplit(string, split=" ") #list -> a[[1]][1~3]
  str_length <- length(a[[1]])
  #print(a[[1]][1])
  reversed <- a[[1]][str_length:1]
  reversed
  paste(reversed, collapse=" ")
}

# bug -> nchar(letter by letter)
rev_word("are you stupid?")
nchar("how are you?")
