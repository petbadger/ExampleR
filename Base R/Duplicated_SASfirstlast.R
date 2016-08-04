# R equivalent of .first or .last sas automatic variables
# FIRST. and LAST. are not operators; they are automatic SAS data step variables 
#   defined to indicate column value changes during BY statement processing.

data.firstlast <- read.table(header=TRUE, text='
  id     text
  1      treated 
  2      treated 
  3      treated 
  4      untreated
  5      untreated
  6      treated 
  7      treated 
  8      untreated
  9      untreated
  10     untreated
  11     untreated
  12     treated 
  13     treated 
  14     untreated
  14     untreated
  15     untreated
                             ')

# from R base...
?duplicated

!duplicated(data.firstlast$text)
data.firstlast$first <- !duplicated(data.firstlast$text)

!duplicated(data.firstlast$text, fromLast=TRUE)
data.firstlast$last <- !duplicated(data.firstlast$text, fromLast=TRUE)

#notice this only works for the first INSTANCE of each level  
View(data.firstlast)


#This function mimics the SAS .FIRST var
isFirstInRun <- function(x,...) {
  lengthX <- length(x)
  if (lengthX == 0) return(logical(0))
  retVal <- c(TRUE, x[-1]!=x[-lengthX])
  for(arg in list(...)) {
    stopifnot(lengthX == length(arg))
    retVal <- retVal | c(TRUE, arg[-1]!=arg[-lengthX])
  }
  if (any(missing<-is.na(retVal))) # match rle: NA!=NA
    retVal[missing] <- TRUE
  retVal
}

within(data.firstlast, first <- isFirstInRun(data.firstlast$text))


# This function mimics SAS' .LAST var
isLastInRun <- function(x,...) {
  lengthX <- length(x)
  if (lengthX == 0) return(logical(0))
  retVal <- c(x[-1]!=x[-lengthX], TRUE)
  for(arg in list(...)) {
    stopifnot(lengthX == length(arg))
    retVal <- retVal | c(arg[-1]!=arg[-lengthX], TRUE)
  }
  if (any(missing<-is.na(retVal))) # match rle: NA!=NA
    retVal[missing] <- TRUE
  retVal
}

within(data.firstlast, last <- isLastInRun(data.firstlast$text))

