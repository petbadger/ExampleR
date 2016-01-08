## Coercing objects

c(TRUE, FALSE)
c(TRUE, FALSE) + 0
c(TRUE, FALSE) + 1


c("red", "blue")[c(F, F, T, T) + 1]
# [1] "red"  "red"  "blue" "blue"
c("red", "blue")[c(F, F, T, T)]
c("red", "blue")[c(0, 0, 1, 1)]
c("red", "blue")[c(1, 1, 2, 2)]