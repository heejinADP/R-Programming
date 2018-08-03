---
title: "Linear model"
author: "heejin"
date: "2018년 8월 1일"
output: html_document
---
1. Build Data frame
```{r}
age <- c(18, 23, 25, 35, 65, 54, 34, 56, 72, 19, 23, 42, 18, 39, 37)
maxHR <- c(202, 186, 187, 180, 156, 169, 174, 172, 153, 199, 193, 174, 198, 183, 178)
df <- data.frame(age, maxHR)
df
```


2. Linear Regression model
```{r}
lm_result <- lm(maxHR ~ age, data = df)
lm_result
```

3. Visualization
```{r}
install.packages("ggplot2")
library(ggplot2)
ggplot(df, aes(age, maxHR)) + geom_point() +
xlab("AGE") + ylab("Maximum Heart Rate") + ggtitle("Relation between Maximum heart Rate and Age") + stat_smooth(method = lm)       
       
```