testFun <- function(var1, var2){
  div <- var1/var2
}


x <- matrix(rnorm(10), nrow=5)
apply(x,1,mean)
apply(x,2,mean)

x[1]

## x2 also works as x.  It's the matrix you send into your function
apply(x,1,FUN=function(x2) testFun(x2[1], x2[2]))
result <- apply(x,1,FUN=function(x2) testFun(x2[1], x2[2]))
result
typeof(result)
x <- cbind(x, as.matrix(result))

abs(x)
round(x,1)

#--------------
testFun2 <- function(var1, var2){
  if(var1 > var2){
    "ASSIS"
  }else if(var1==var2){
    "TEST"
  }else if(var1 < var2){
    "GONE"
  }else{
    "ELSE"
  }
}

testFun2(3, 2)

x <- round(abs(matrix(rnorm(30), nrow=15)), 1)
x

#first run was NULL because nothing was greater?
apply(x,1,FUN=function(x2) testFun2(x2[1], x2[2]))
result <- apply(x,1,FUN=function(x2) testFun2(x2[1], x2[2]))
result
typeof(result)
x <- cbind(x, as.matrix(result))
x
as.data.frame(x)


