library(tidyr)
#---------------

# Wide to Long
wide <- read.table(header = TRUE, text='id sex age rank2014 rank2015 rank2016 rand2015 rand2016 rand2017 
1   F  35 assis assis assoc 0.1 0.3 0.4 
17  M  50 full  full  full  0.3 0.3 0.6
33  F  45 assis assis assis 1.2 1.3 1.4
49  M  24 assoc assoc full  3.4 0.3 0.9
65  F  52 assoc full  assis 4.3 1.0 1.8
50  M  35 assis assoc full  8.2 3.8 7.2')   

# Use GATHER to go from wide to long
wide_to_long <- gather(wide, year, rank, rank2014:rank2016)
library(stringr)
wide_to_long$year <- as.numeric(str_extract(wide_to_long$year, "[0-9]+")) 
wide_to_long <- gather(wide_to_long, year, rand, rand2015:rand2016)


# Long to Wide
long <- read.table(header = TRUE, text='id sex age rank year rand
1   F  35 assis 2014 0.1
17  M  50 full  2014 0.3
33  F  45 assis 2014 1.2
49  M  24 assoc 2014 3.4
65  F  52 assoc 2014 4.3
50  M  35 assis 2014 8.2
1   F  35 assis 2015 0.3
17  M  50 full  2015 0.3
33  F  45 assis 2015 1.3
49  M  24 assoc 2015 0.3
65  F  52 full  2015 1.0
50  M  35 assoc 2015 3.8
1   F  35 assoc 2016 0.4
17  M  50 full  2016 0.6
33  F  45 assis 2016 1.4
49  M  24 full  2016 0.9
65  F  52 assis 2016 1.8
50  M  35 full  2016 7.2')

long$yr <- long$year
long_to_wide <- spread(long, year, rank)
#setnames from the data.tablepackage will work on data.frames or data.tables
library(data.table)
new_names <- paste("rank", c(2014:2016), sep = "")
setnames(long_to_wide, old = as.character(2014:2016), new = new_names)

long_to_wide2 <- spread(long_to_wide, yr, rand)
new_names <- paste("rand", c(2014:2016), sep = "")
setnames(long_to_wide2, old = as.character(2014:2016), new = new_names)

#RAND screws it up because it can't compact the data by the ID columns

# Long to Wide
long <- read.table(header = TRUE, text='id sex age rank year rand
                   1   F  35 assis 2014 0.1
                   17  M  50 full  2014 0.3
                   33  F  45 assis 2014 1.2
                   49  M  24 assoc 2014 3.4
                   65  F  52 assoc 2014 4.3
                   50  M  35 assis 2014 8.2
                   1   F  35 assis 2015 0.3
                   17  M  50 full  2015 0.3
                   33  F  45 assis 2015 1.3
                   49  M  24 assoc 2015 0.3
                   65  F  52 full  2015 1.0
                   50  M  35 assoc 2015 3.8
                   1   F  35 assoc 2016 0.4
                   17  M  50 full  2016 0.6
                   33  F  45 assis 2016 1.4
                   49  M  24 full  2016 0.9
                   65  F  52 assis 2016 1.8
                   50  M  35 full  2016 7.2')

long_with_rand <- subset(long, select = -c(rank) ) # drop the rank var
long_with_rank <- subset(long, select = -c(rand) ) # drop the rand var

long_to_wide_rank <- spread(long_with_rank, year, rank)
long_to_wide_rand <- spread(long_with_rand, year, rand)
#setnames from the data.tablepackage will work on data.frames or data.tables
library(data.table)
new_names_rank <- paste("rank", c(2014:2016), sep = "")
new_names_rand <- paste("rand", c(2014:2016), sep = "")

setnames(long_to_wide_rank, old = as.character(2014:2016), new = new_names_rank)
setnames(long_to_wide_rand, old = as.character(2014:2016), new = new_names_rand)
long_to_wide_rand <- subset(long_to_wide_rand, select = -c(sex,age) ) # drop the sex and age to merge cleaner

long_to_wide <- merge(x = long_to_wide_rank, y = long_to_wide_rand, by = "id", all = FALSE)
