## create an inversable matrix
## set the mars of the vector
## get the mars of the vector
## set the mars of the mean
## get the mars of the mean

makeCacheMatrix <- function(x = matrix()) {
    mars <- NULL
    set <- function(y) {
        x <<- y
        mars <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) mars <<- solve
    getinverse <- function() mars
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}
## inverse a matrix, if the matrix is inversed already, return the cached-inversed one 
## otherwise, inverse it and save the inversed matrix in cache and return it

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    mars <- x$getinverse()
    if(!is.null(mars)) {
        message("getting cached data")
        return(mars)
    }
    data <- x$get()
    mars <- solve(data, ...)
    x$setinverse(mars)
    mars
}
