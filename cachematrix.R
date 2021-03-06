## This is a pair of functions that cache the inverse of a matrix


# The first function, makeCachMatrix, creates a special "matrix" object
# that can cache its inverse
makeCacheMatrix = function(x = matrix()) {
    m = NULL
    set = function(y)   {
        x <<- y
        m <<- NULL
    }
    get = function() x
    setinv = function(inv) m <<- inv
    getinv = function() m
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}

# The second function, cacheSolve, retrieves the inverse of the special "matrix"
# returned by the above function from the cache if it has been already calculated 
# and the matrix has not been changed. Otherwise, it computes the inverse. 
cacheSolve = function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m = x$getinv() 
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data = x$get()
    m = solve(data, ...)
    x$setinv(m)
    m
}