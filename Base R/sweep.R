#sweep is typically used when you operate a matrix by row or by column, 
#and the other input of the operation is a different value for each row / column.
#Whether you operate by row or column is defined by MARGIN, as for apply. The values 
#used for what I called "the other input" is defined by STATS. So, for each row 
#(or column), you will take a value from STATS and use in the operation defined 
#by FUN. 

#For instance, if you want to add 1 to the 1st column, 2 to the 2nd, etc... of the 
#matrix you defined, you will do:
  
#sweep (M, 1, c (1: 4), "+")  

# sweep() can be great for systematically manipulating a large matrix 
#either column by column, or row by row, as shown below:

## Example 1
size <- read.table(header = TRUE, text='Weight Waist Height
130    26    140
110    24    155
118    25    142
112    25    175
128    26    170')

sweep(size, 2, c(10, 20, 30), "+")
#Weight Waist Height
#[1,]    140    46    170
#[2,]    120    44    185
#[3,]    128    45    172
#[4,]    122    45    205
#[5,]    138    46    200


## Example 2

#You could use sweep function to scale and center data like the following code. 
#Note that means and sds are arbitrary here (you may have some reference values 
#that you want to standardize data based on them):
  
df=matrix(sample.int(150, size = 100, replace = FALSE),5,5)

df_means=t(apply(df,2,mean))
df_means
df_sds=t(apply(df,2,sd))
df_sds

df_T=sweep(sweep(df,2,df_means,"-"),2,df_sds,"/")*10+50

#This code convert raw scores to T scores (with mean=50 and sd=10):
print(df)
print(df_T)


## Example 3
#creating the data set
a <- matrix(runif(100, 1, 2),20)
a.df <- data.frame(a)
a.df

#subtract column means from each column
#centering each column around mean
colMeans(a)
#[1] 1.470437 1.497412 1.553592 1.454150 1.613789

a1 <- sweep(a, 2, colMeans(a), "-")
a1[1:5,  ]
#[,1]        [,2]       [,3]        [,4]        [,5] 
#[1,] -0.4285240 -0.42115156 -0.1069188 -0.07067987 -0.46239745
#[2,] -0.4087171 -0.26986445  0.1232513 -0.38962010  0.35919248
#[3,]  0.5000310 -0.42625368 -0.3284257 -0.42179545  0.06797352
#[4,] -0.4324198 -0.22340951  0.2689937  0.01781444 -0.01896476
#[5,]  0.5256995  0.06979928 -0.3596666 -0.03256511 -0.25716789

colMeans(a1)
#[1] -4.440892e-017  4.440892e-017  8.881784e-017  8.881784e-017  8.881784e-017

#dividing each column by sum
a2 <- sweep(a, 2, colSums(a), "/")
a2[1:5,  ]
#[,1]       [,2]       [,3]       [,4]       [,5] 
#[1,] 0.03542869 0.03593735 0.04655898 0.04756972 0.03567355
#[2,] 0.03610219 0.04098897 0.05396666 0.03660317 0.06112886
#[3,] 0.06700280 0.03576699 0.03943012 0.03549684 0.05210602
#[4,] 0.03529621 0.04254014 0.05865716 0.05061254 0.04941242
#[5,] 0.06787562 0.05233066 0.03842467 0.04888027 0.04203217

#centering each row around the mean of the row
rowMeans(a)[1:5]
#[1] 1.219942 1.400724 1.396182 1.440279 1.507096

a3 <- sweep(a, 1, rowMeans(a), "-")
a3[1:5,  ]
#[,1]        [,2]       [,3]        [,4]        [,5] 
#[1,] -0.1780286 -0.14368139  0.2267312  0.16352895 -0.06855023
#[2,] -0.3390045 -0.17317704  0.2761186 -0.33619404  0.57225694
#[3,]  0.5742861 -0.32502378 -0.1710159 -0.36382689  0.28558047
#[4,] -0.4022616 -0.16627648  0.3823066  0.03168612  0.15454532
#[5,]  0.4890407  0.06011528 -0.3131707 -0.08551046 -0.15047484

rowMeans(a3)[1:5]
#[1]  0.000000e+000 -4.440892e-017 -8.881784e-017  4.440892e-017 -4.440892e-017