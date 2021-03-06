# Coursera
# John Hopkins - R Programming Course
# Assignment 2
# 
# Shane Close
# 19/02/2015
# 
# Matrix inversion is usually a costly computation and there may be some benefit to caching
# the inverse of a matrix rather than compute it repeatedly (there are also alternatives to matrix 
# inversion that we will not discuss here). Your assignment is to write a pair of functions
# that cache the inverse of a matrix.

# Write the following functions:
#         
# makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
# cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
# If the inverse has already been calculated (and the matrix has not changed), then the cachesolve
# should retrieve the inverse from the cache.
# Computing the inverse of a square matrix can be done with the solve function in R. 
# For example, if X is a square invertible matrix, then solve(X) returns its inverse.
# 
# For this assignment, assume that the matrix supplied is always invertible.

#makecachematrix - 

makeCacheMatrix <- function(x = matrix()) {
        #Copied from the makeVector example       
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        
       
        setinverse <- function(solve) m <<-solve
        getinverse <- function() m
        
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

#Use the Solve function to return the invere of a matrix
#Unless it is already cached

cacheSolve <- function(x, ...) {
        # Check if a matrix that is the inverse of 'x' exists
        m <- x$getinverse()
        #if m is not null then return m
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()  # get the matrix from makeCacheMatrix
        m <- solve(data, ...)  # Calculate the inverse
        x$setinverse(m)  #Set the cache
        m
        
}
