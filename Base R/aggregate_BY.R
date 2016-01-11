#Note that BY requires list as argument

mydata <- read.table(header=TRUE, text='id var1 var2 var3 groupid1 groupid2
                     1     42    0     10	A X
                     2     51    2     11	B X
                     3     59    4     19	A X
                     4     64    6     21	A Y
                     5     76    8     22	B Y
                     6     93   10     29	B Y')


## Example 1
aggregate(mydata$var1, by=list(mydata$groupid1), FUN=min)
aggregate(mydata$var2, by=list(mydata$groupid1), FUN=max)
aggregate(mydata$var3, by=list(mydata$groupid1), FUN=mean)

## Example 2
aggregate(mydata$var1, by=list(mydata$groupid1), FUN=mean)
tapply(mydata$var1, mydata$groupid1, mean)

## Exmaple 3 - Group By multiple columns
aggregate(var1 ~ groupid1+groupid2,data = mydata,FUN=mean )
# Can do all the numeric vars using the dot:
aggregate(. ~ groupid1+groupid2,data = mydata,FUN=mean )
# Can also calculate many things through a user defined function
aggregate(. ~ groupid1+groupid2,data = mydata,FUN=function(x) c(mn =mean(x), n=length(x) ) )

## Example 4 - You could add a count column, aggregate with sum, then scale 
#             back to get the mean
mydata$count <- 1
agg <- aggregate(. ~ groupid1 + groupid2, data = x,FUN = sum)
agg[c("var1", "var2")] <- agg[c("var1", "var2")] / agg$count



# aggregate is designed to work on multiple columns with one function 
# and return a dataframe with one row for aech category, while tapply is 
# designed to work on a single vector with results returned as a matrix or 
# array. Only using a two column matrix does not really allow the capacities 
# of either function (or their salient differences) to be demonstrated. 
# `aggregate also has a formula method, which tapply does not.

mydata <- data.frame(amount=c(1,2,1,2,1,1,2,2,1,1,1,2,2,2,1), 
                     cat=sample(letters[21:24], 15,rep=TRUE),
                     card=c("a","b","c","a","c","b","a","c","b","a","b","c","a","c","a"))

with( mydata, tapply(amount, INDEX=list(cat,card), mean) )

aggregate(amount~cat+card, data=mydata, FUN= mean) 

## data.table has 'with' and 'by' built right into it
#library(data.table)
#df2 <- setDT(mydata)[, lapply(.SD, sum), by=.(year, month), .SDcols=c("x1","x2")]

## See also https://www.youtube.com/watch?v=hvITFzz2Xto
