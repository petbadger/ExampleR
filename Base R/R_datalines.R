#--------------
# In SAS, there is a way to add code in the program itself.
# This is valuable for quickly testing some code or learning, or to illustrate
# Often in R, examples will use rnorm or runif to generate some data, but what 
# the data is of a different type?  How does one easily create a fake data set
# to post on SO or other forum?
#
# Example in SAS:
# equivalent R code for following SAS code: 
# DATA survey; 
# INPUT id sex $ age inc r1 r2 r3 ; 
# DATALINES; 
# 1  F  35 17  7 2 2 
# 17  M  50 14  5 5 3 
# 33  F  45  6  7 2 7 
# 49  M  24 14  7 5 7 
# 65  F  52  9  4 7 7 
# 81  M  44 11  7 7 7 
# 2   F  34 17  6 5 3 
# 18  M  40 14  7 5 2 
# 34  F  47  6  6 5 6 
# 50  M  35 17  5 7 5 
# ; 

# EXAMPLE ZERO
olddata_long <- read.table(header=TRUE, text='
 subject sex condition measurement
1   M   control         7.9
1   M     cond1        12.3
1   M     cond2        10.7
2   F   control         6.3
2   F     cond1        10.6
2   F     cond2        11.1
3   F   control         9.5
3   F     cond1        13.1
3   F     cond2        13.8
4   M   control        11.5
4   M     cond1        13.4
4   M     cond2        12.9
                           ')

# EXAMPLE ONE:
toread <- "id sex age inc r1 r2 r3 
1  F  35 17  7 2 2 
17  M  50 14  5 5 3 
33  F  45  6  7 2 7 
49  M  24 14  7 5 7 
65  F  52  9  4 7 7 
81  M  44 11  7 7 7 
2   F  34 17  6 5 3 
18  M  40 14  7 5 2 
34  F  47  6  6 5 6 
50  M  35 17  5 7 5" 

survey <- read.table(textConnection(toread), header = TRUE) 
closeAllConnections() 
survey 


#(not quite the same, but it's useful. Let's you type the numbers on a prompt.)
# EXAMPLE TWO: 
test <- data.frame(scan(file = "", what = list(x1 = 0, x2 = 0, x3 = 0, y = ""))) 
# and then type: 71 NA 3 0 158 14 3 0 128 5 4 1 
# blank entry stops the prompting and saves the data to 'test'