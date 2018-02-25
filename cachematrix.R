makeCacheMatrix  <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  set_inverse <- function(inverse) m <<- inverse
  get_inverse <- function() m
  list(set = set, get = get,
       set_inverse = set_inverse,
       get_inverse = get_inverse)
}

## The function CacheSolve retrieves the inverse of the matrix from the cache if that data is available 
## (i.e., if the inverse has already been calculated and the matrix hasn't changed). Otherwise, the function
## retrieves the inverse from the cache, including a message indicating that it is "getting cached data". 

cacheSolve <- function(x, ...) {
  m <- x$get_inverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$set_inverse(m)
  m
}


## Testing

#Defining the matrix T
a <- matrix(c(2:5),2,2)

b <- makeCacheMatrix(a)
cacheSolve(b) 

# Checking to see that, once computed, the cacheSolve function will retrieve the stored information from the cache
cacheSolve(b)

# It does, per the message "getting cached data"
## getting cached data
## [,1] [,2]
## [1,]   -2.5    2
## [2,]    1.5   -1
