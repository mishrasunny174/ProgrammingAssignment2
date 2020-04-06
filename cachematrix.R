## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inverseM <- NULL
  set <- function(y) {
    m <<- y
    m <<- null
  }
  get <- function() x
  setInverse <- function(inverseMatrix) inverseM <<- inverseMatrix
  getInverse <- function() inverseM
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        inverseM <- x$getInverse()
        if(!is.null(inverseM)) {
          message("Getting cached inverse")
          return(inverseM)
        }
        m <- x$get()
        inverseM <- solve(m)
        x$setInverse(inverseM)
}


# tesing the functionality
m <- matrix(data=c(1,2,3,4), nrow = 2, ncol = 2, byrow = TRUE)
cachedM <- makeCacheMatrix(m)
inverseM <- cacheSolve(cachedM)
inverseM2 <- cacheSolve(cachedM)
