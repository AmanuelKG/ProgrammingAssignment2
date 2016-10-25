## Below are two functions that are used to create a special object 
##that stores a a matrix of numbers and cache's its mean.


## The first function, makeCacheMatrix creates a special "Matrix"
##which is really a list containing a function to
##1.set the value of the Matrix
##2.get the value of the Matrix
##3.set the value of the inverse
##4.get the value of the inverse

makeCacheMatrix <- function(x =matrix()) {
  i <-NULL
set <- function(y) {
  x <<- y
  i <<- NULL
}
get <- function() x
setinverse <- function(solve) i <<- solve
getinverse <- function() i
list(set = set, get = get,
     setinverse = setinverse,
     getinverse = getinverse)

}

## The following function calculates the inverse of the special "Matrix"
##created with the above function. 
#However, it first checks to see if the inverse has already been calculated. 
##If so, it gets the inverse from the cache and skips the computation. 
##Otherwise, it calculates the inverse of the data and sets the value 
##of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
if(!is.null(i)) {
  message("getting cached data")
  return(i)
}
data <- x$get()
i<- solve(data, ...)
x$setinverse(i)
i
        ## Return a matrix that is the inverse of 'x'
}
