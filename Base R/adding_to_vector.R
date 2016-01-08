
mylist <- list()
mylist <- c(mylist, ASSIS=2014)
mylist <- c(mylist, ASSIS=2014)
mylist <- c(mylist, ASSIS=2014)
mylist <- c(mylist, ASSIS=2015)
mylist <- c(mylist, ASSOC=2015)
mylist <- c(mylist, ASSOC=2016)
mylist <- c(mylist, ASSOC=2016)
mylist <- c(mylist, FULL=2015)
mylist <- c(mylist, FULL=2015)

unlist(mylist)
unlist(mylist[1])
unlist(mylist[[1]])
mylist[7]
table(mylist)

matrix(unlist(mylist), length(mylist), 2, byrow=FALSE)
table(unlist(mylist))


myvec <- vector()
myvec <- c(myvec, "ASSIS", "2014")
myvec <- c(myvec, "ASSIS", "2014")
myvec <- c(myvec, "ASSIS", "2014")
myvec <- c(myvec, "ASSIS", "2015")
myvec <- c(myvec, "ASSOC", "2015")
myvec <- c(myvec, "ASSOC", "2016")
myvec <- c(myvec, "ASSOC", "2016")
myvec <- c(myvec, "FULL", "2015")
myvec <- c(myvec, "FULL", "2015")

myvec_df <- data.frame(matrix(myvec, length(myvec), 2, byrow=TRUE))
myvec_df
table(myvec_df)
