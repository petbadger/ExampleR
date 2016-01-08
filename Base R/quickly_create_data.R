## Some ways to quickly create mock data

#Generate example dataframe with character column
example <- as.data.frame(c("A", "A", "B", "F", "C", "G", "C", "D", "E", "F"))
names(example) <- "strcol"

#For every unique value in the string column, create a new 1/0 column
#This is what Factors do "under-the-hood" automatically when passed to function requiring numeric data
for(level in unique(example$strcol)){
  example[paste("dummy", level, sep = "_")] <- ifelse(example$strcol == level, 1, 0)
}


employee <- c('John Doe','Peter Gynn','Jolie Hope')
salary <- c(21000, 23400, 26800)
startdate <- as.Date(c('2010-11-1','2008-3-25','2007-3-14'))
employ.data <- data.frame(employee, salary, startdate)
#By default, R always transforms character vectors to factors when creating a data frame 
#with character vectors or converting a character matrix to a data frame. 


library(dummies)
letters <- c( "a", "a", "b", "c", "d", "e", "f", "g", "h", "b", "b" )
dummy( as.character(letters) )
dummy( letters[1:6] )
l <- as.factor(letters)[ c(1:3,1:6,4:6) ]
dummy(l)
dummy(l, drop=FALSE)
dummy(l, sep=":")
dummy(l, sep="::", fun=as.logical)
# TESTING NAS
l <- c( NA, l, NA)
dummy(l)
dummy(l,sep=":")
dummy(iris$Species)
dummy(iris$Species[ c(1:3,51:53,101:103) ] )
dummy(iris$Species[ c(1:3,51:53,101:103) ], sep=":" )
dummy(iris$Species[ c(1:3,51:53) ], sep=":", drop=FALSE )
# TESTING TRAP FOR ONE LEVEL
dummy( as.factor(letters)[c(1,1,1,1)] )
dummy( as.factor(letters)[c(1,1,2,2)] )
dummy( as.factor(letters)[c(1,1,1,1)] , drop = FALSE )
dummy.data.frame(iris)
dummy.data.frame(iris, all=FALSE)
dummy.data.frame(iris, dummy.class="numeric" )
dummy.data.frame(iris, dummy.class="ALL" )
