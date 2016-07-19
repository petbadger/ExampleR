# Example showing indexing/replacement by row names 

original = expand.grid(ID1=c('a', 'b', 'c'), ID2 = c('red', 'green', 'blue'))
original$value = 0

replacement = data.frame(ID1='b', ID2='red', value=1)

rownames(original) = paste(original$ID1, original$ID2)
rownames(replacement) = paste(replacement$ID1, replacement$ID2)

original[rownames(replacement), ] = replacement

original
