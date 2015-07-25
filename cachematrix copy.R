<<<<<<< HEAD
## These functions, makeCachematrix and cacheSolve, are useful for storing an inverse
## matrix outside of the current environment and being able to recall it.

## This is useful in loops because if finding a matrix's inverse takes .01 seconds
## (not accurate, just a guess), that can add up to a lot of total time if being 
## done like 10,000 times in a loop.

## makeCacheMatrix is a function that stores a matrix's inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve(x)
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## cacheSolve is a function that finds if the inverse of a matrix has already been
## cached.  If yes, it tells you that it's getting the cached inverse and returns 
## the cached inverse matrix.  Otherwise, it computes the inverse, caches and returns it.

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}

>>>>>>> 7f657dd22ac20d22698c53b23f0057e1a12c09b7
