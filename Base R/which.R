# By using which() command to select the rows, we are able to achieve one-third the speed of Rcpp.

# Create the data frame
col1 <- runif (12^5, 0, 2)
col2 <- rnorm (12^5, 0, 2)
col3 <- rpois (12^5, 3)
col4 <- rchisq (12^5, 2)
df <- data.frame (col1, col2, col3, col4)

want = which(rowSums(df) > 4) #vector or row numbers that meet condition
output = rep("less than 4", times = nrow(df))
output[want] = "greater than 4"

