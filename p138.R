# p138

# Q1
mpgnew=mpg
mpgnew %>% select(class, city)

# Q2
suv=mpgnew %>% filter(class=="suv")
mean(suv$city) #13.5
compact=mpgnew %>% filter(class=="compact")
mean(compact$city) #20.12766

