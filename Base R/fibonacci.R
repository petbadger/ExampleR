len <- 700
fibvals <- numeric(len)
fibvals[1] <- 1
fibvals[2] <- 1
for (i in 3:len) { 
  fibvals[i] <- fibvals[i-1]+fibvals[i-2]
} 

as.data.frame(fibvals)

v <- vector()

for (fib in fibvals) {
  #print("fib value:")
  #print(fib)
  c <- as.character(fib)
  l <- strsplit(c,split="")
  
  v<-append(v,as.numeric(unlist(l)))
  for (i in nchar(c)) {
    #print("nchar value:")
    #print(i)
    
    #print(substr(i,1,1))
    #v <- append(v,i)
  }
}

print(v)



v1 <- v[!is.na(v)]
print(v1)

#http://stackoverflow.com/questions/9665984/how-to-delete-multiple-values-from-a-vector
remove <- c(0)
v1 %in% remove   #will return T and F

v2 <- v1 [! v1 %in% remove]   #will subset
print(v2)



hist(v2)
