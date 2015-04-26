## Put comments here that give an overall description of what your
## functions do

## This function takes a matrix as an argument and returns a list of four functions:
##: get: returns the matrix, set: sets the value of the matrix, 
## setinverse: caches the value of the matrix inverse
## getinverse: retrieves the inverse value from the cache

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
set <- function(y)
{
x <<- y
m <<- NULL
}
get <- function() x
setinverse <- function(solve) m <<- solve
getinverse <- function() m
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## This function takes a makeCacheMatrix of some matrix as an argument, 
##looks in the cache to see if an inverse is already stored there, retrieves it if so,
## if not, it computes it and stores it in the cache.


cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
m <- x$getinverse()
if(!is.null(m)) {
message("getting cached inverse")
return(m)
}
data <- x$get()
m <- solve(data, ...)
x$setinverse(m)
m
