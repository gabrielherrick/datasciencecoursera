count<-0
while(count<10){
  print(count)
  count<-count+1
}

x=c("a", "b", "c", "d")

for (bran in x) {
    print (bran)
}


for(i in seq_len(nrow(x))){
  for (j in seq_len(ncol(x))){
    print(x[i,j])
  }
}

x <- c(1, 5, 10, 15, 20, 15, 10, 5, 1)

above10 <- function(x) {
    use <- x > 10
    x[use]
}
x<-list(a=1, b=2, c=3)

#Functions (part 1)

#f<- function (<arguments>) {
  ## Do something interesting
#}

mydata<-rnorm(100)
sd(mydata)
sd(x=mydata)
sd(x=mydata, na.rm=F)
sd(na.rm=F, x=mydata)
sd(na.rm=F,mydata)

