library(dplyr)
mpg=mpgcopy
mpgcopy<-as.data.frame(ggplot2::mpg)
class(mpgcopy)

mpgcopy=mutate(mpgcopy, tot=(mpgcopy$cty+mpgcopy$hwy)/2)
mpgcopy=filter(mpgcopy, class=="compact"|class=="suv") 
mpgcopy=group_by(mpgcopy, class)
summarise(mpgcopy, mean=mean(tot))
