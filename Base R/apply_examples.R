# Example taken from http://www.r-bloggers.com/strategies-to-speedup-r-code/

# create dummy data frame
col1 <- runif (12^5, 0, 2)
col2 <- rnorm (12^5, 0, 2)
col3 <- rpois (12^5, 3)
col4 <- rchisq (12^5, 2)
df <- data.frame (col1, col2, col3, col4)


myfunc <- function(x) {
  if ((x['col1'] + x['col2'] + x['col3'] + x['col4']) > 4) {
    "greater_than_4"
  } else {
    "lesser_than_4"
  }
}
output <- apply(df[, c(1:4)], 1, FUN=myfunc)  # apply 'myfunc' on every row
df$output <- output

