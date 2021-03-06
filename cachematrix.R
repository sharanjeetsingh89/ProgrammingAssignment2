## A pair of function that cache the inverse of a matrix


## Create a special matrix object that can cache its inverse

makeCacheMatrix <- function(m = matrix()) {
i <- NULL
set <- function(matrix){
  m <<- matrix
  i <- NULL
}
get <- function() {
  m
}
setinverse <- function(inverse) {
  i <<-inverse
}
getinverse <- function () 
  {
  i
}
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Compute the inverse of special matrix returned by "makeCacheMatrix" above
## If the inverse has already been calculated ( and the matrix has not changed)
## then the "cachesolve" should retrive the inverse from the cache
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  If(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data <-x$get()
  m <- solve(data) %*% data
  x$setinverse(m)
  m
}
