## Put comments here that give an overall description of what your
## functions do





#caching the inverse of a matrix
#set input x  as a matrix
#assume that our matrix is square matrix
#inverse of a square matrix is given by the function solve() in R. s<-solve() ## same as m<-mean() in the example
#take inverse instead of mean

# create makeCacheMatrix
makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}

#create cacheSolve
cacheSolve <- function(x, ...) {
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data of inverse matrix")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}


# Tips, replace input varible x=matrix, s=m, mean()=solve() in given example

#let's create a square matrix of 3 by 3
x <- matrix(rnorm(9),3,3,byrow = TRUE)
x
#assign the out put of makeCacheMatrix to variable x1
x1 <- makeCacheMatrix(x)
x1

#get inverse of x1
cacheSolve(x1)


