#Program that reads an ascii text files last line and increments by one
#could also use tail(increment_data,1) to get the last line
#there is also a counter() in the misc package that could help

setwd("E:\\_Temp\\RapidMinerTest")
fname <- "increment.txt"

increment_data <- readLines(fname)
increment_length <- length(increment_data)

next_increment <- NA

if(increment_length == 0){
  next_increment <- 1
}else{
  next_increment <- as.numeric(increment_data[increment_length]) + 1
  
}

write(next_increment,file=fname,append=TRUE)
