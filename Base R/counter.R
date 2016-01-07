createCounter <- function(value) { function(i) { value <<- value+i} }

aa <- createCounter(0)
aa(1)
total_a <- aa(0)
total_a 

bb <- createCounter(0)
bb(1)
total_b <- bb(0)
total_b 


