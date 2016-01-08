## Prime number checker generator
# Note that the spuRs package has prime funding functions

#
# Example 1: The sieve algorithm
sieve <- function(n)
{
  n <- as.integer(n)
  if(n > 1e6) stop("n too large")
  primes <- rep(TRUE, n)
  primes[1] <- FALSE
  last.prime <- 2L
  for(i in last.prime:floor(sqrt(n)))
  {
    primes[seq.int(2L*last.prime, n, last.prime)] <- FALSE
    last.prime <- last.prime + min(which(primes[(last.prime+1):n]))
  }
  which(primes)
}

sieve(10)


# Example 1 improved:
sieve <- function(n)
{
  n <- as.integer(n)
  if(n > 1e8) stop("n too large")
  primes <- rep(TRUE, n)
  primes[1] <- FALSE
  last.prime <- 2L
  fsqr <- floor(sqrt(n))
  while (last.prime <= fsqr)
  {
    primes[seq.int(2L*last.prime, n, last.prime)] <- FALSE
    sel <- which(primes[(last.prime+1):(fsqr+1)])
    if(any(sel)){
      last.prime <- last.prime + min(sel)
    }else last.prime <- fsqr+1
  }
  which(primes)
}

sieve(1000000)


# Example 2: much faster because vectorized
primes <- function(n){
  primesR <- function(p, i = 1){
    f <- p %% p[i] == 0 & p != p[i]
    if (any(f)){
      p <- primesR(p[!f], i+1)
    }
    p
  }
  primesR(2:n)
}

primes(10)


# Example 3: faster yet
primest <- function(n){
  p <- 2:n
  i <- 1
  while (p[i] <= sqrt(n)) {
    p <-  p[p %% p[i] != 0 | p==p[i]]
    i <- i+1
  }
  p
}

primest(300)

## Check if number is prime:

# Example 1: sort of works for large numbers, but does not for numbers like 2 and 3
isPrime <- function(x){
  div <- 2:ceiling(sqrt(x))
  !any(x %% div == 0)
}

# Example 2: working version
is.prime <- function(num) {
  if (num == 2) {
    TRUE
  } else if (any(num %% 2:(num-1) == 0)) {
    FALSE
  } else { 
    TRUE
  }
}

# Example 3: put it on one line
is.prime <- function(n) n == 2L || all(n %% 2L:ceiling(sqrt(n)) != 0)

# Example 4: Uses a library
library(matlab)
as.logical(isprime(7))
as.logical(isprime(42))