# p88 dataFrame

# Q1
fruit=c("사과","딸기","수박")
price=c(1800, 1500, 3000)
quantity=c(24, 38, 13)

fruitDf=data.frame(price, quantity, row.names=fruit)
fruitDf

# Q2
fruitDf['price']
priceMean=mean(fruitDf[[1]])
priceMean
quantity=mean(fruitDf[[2]])
quantity