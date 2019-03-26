# Discretize a continuous variable

set.seed(123)
df <- data.frame(a = rnorm(100))

#base
df$category <- cut(df$a, 
                   breaks=c(-Inf, 0.5, 0.6, Inf), 
                   labels=c("low","middle","high"))
df


#dplyr
library(dplyr)
res <- df %>% mutate(category=cut(a, breaks=c(-Inf, 0.5, 0.6, Inf), labels=c("low","middle","high")))
res

identical(df, res)

#using quantiles for cut
xs=quantile(df$a,c(0,1/3,2/3,1))
xs[1]=xs[1]-.00005
df1 <- df %>% mutate(category=cut(a, breaks=xs, labels=c("low","middle","high")))
boxplot(df1$a~df1$category,col=3:5)

df1

