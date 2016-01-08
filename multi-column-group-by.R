library(dplyr)

df <-  data.frame(
  col1 = sample(LETTERS[1:3], 100, replace=TRUE),
  col2 = sample(LETTERS[1:3], 100, replace=TRUE),
  value = rnorm(100)
)


# Columns you want to group by
grp_cols <- names(df)[-3]

# Convert character vector to list of symbols
dots <- lapply(grp_cols, as.symbol)

# Perform frequency counts
df %>%
  group_by_(.dots=dots) %>%
  summarise(n = n())


df2 <- group_by(df,newcol=paste(col1,col2,sep="_")) %>% summarise(Value=mean(value))

#http://stackoverflow.com/questions/21208801/group-by-multiple-columns-in-dplyr-using-string-vector-input

df2$EMPID <- strsplit(df2$newcol, "_")

lst <- unlist(strsplit(df2$newcol, "_"))
mat <- matrix(lst, ncol = 2, byrow = TRUE)
df3 <- as.data.frame(mat, col_names=c("EMPID", "CURRENT.RANK"))


as.data.frame(strsplit(df2$newcol, "_"))

library(dplyr)
mutate(df2,
       EMPID = strsplit(df2$newcol, "_")[[1]], 
       CURRENT.RANK = strsplit(df2$newcol, "_")[[2]],
       value = value
)
