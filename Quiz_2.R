#Quiz 2

#Question 1
cube<- function (x,n) {
        x^3
}
27
#Question 2
x<- 1:10
if(x>5) {
        x<-0
}
x is a vector of length 10
#Question 3

f<- function(x) {
        g<-function (y) {
                y+z
        }
        z<-4
        x+g(x)
}
    10    
#Question 4

x <- 5
y <- if(x < 3) {
        NA
} else {
        10
}
10
#Question 5

h <- function(x, y = NULL, d = 3L) {
        z <- cbind(x, d)
        if(!is.null(y))
                z <- z + y
        else
                z <- z + f
        g <- x + y / z
        if(d == 3L)
                return(g)
        g <- g + 10
        g
}
f

#Q6
a collection of symbol/value pairs

#Q7
lexical scoping

#Q8
?
defined
#9
all objects must be stored in memory

#10

it is the environment in which a function was called
