I will show you the output from the sample functions to illustrate their behaviour. From the output you should be able to discern the logic within the R code.The sample run show below can be adapted to the new functions for matrices and the behaviour will be the same.
The code i have written ids given below:


makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get, setmean = setmean, getmean = getmean)
}

cachemean <- function(x, ...) {
  m <- x$getmean()
  if (!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}
 output:-
 > a <- makeVector(c(1,2,3,4))
> a$get()
[1] 1 2 3 4
> a$getmean()
NULL
> cachemean(a)
[1] 2.5
> a$getmean()
[1] 2.5
> a$set(c(10,20,30,40))
> a$getmean()
NULL
> cachemean(a)
[1] 25
> a$getmean()
[1] 25
> cachemean(a)
getting cached data
[1] 25
    
