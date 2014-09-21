## create an inversable matrix
## set the VALUE of the vector
## get the VALUE of the vector
## set the VALUE of the mean
## get the VALUE of the mean

makeCacheMatrix <- function(x = matrix()) {
    VALUE <- NULL
    set <- function(y) {
        x <<- y
        VALUE <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) VALUE <<- solve
    getinverse <- function() VALUE
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}
## inverse a matrix, if the matrix is inversed already, return the cached-inversed one 
## otherwise, inverse it and save the inversed matrix in cache and return it

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    VALUE <- x$getinverse()
    if(!is.null(VALUE)) {
        message("getting cached data")
        return(VALUE)
    }
    data <- x$get()
    VALUE <- solve(data, ...)
    x$setinverse(VALUE)
    VALUE
}
