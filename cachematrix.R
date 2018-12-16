## A pair of functions that cache the inverse of a matrix

## Define function to set the value of the matrix. It also clears the old inverse from the cache.
makeCacheMatrix <- function(m = matrix()) {
  i <- NULL
  set <- function(matrix) {
    m <<- matrix   
    i <<- NULL 
  }
## Define function to get the value of the matrix
  get <- function() {
    m
  }
## Define function to set the inverse.
  setInverse <- function(inverse) {
    i <<- inverse 
  }
## Define function to get the inverse
  getInverse <- function() {
    i
  }
  
## Return a list with methods
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Return inverse of matrix x
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed),
##then the cachesolve retrieves the inverse from the cache.
cacheSolve <- function(x,...) {
  m <- x$getInverse() 
## This fetches the cached value for the inverse
  if(!is.null(m)) { 
    
## If the cache was not empty, we can just return it
    message("getting cached data")
    return(m)
  }
## The cache was empty. We need to get value ffrom matrix, calculate it, cache it, and then return it.
  data <- x$get()  
  m <- solve(data) 
  x$setInverse(m)  
  m                
}
