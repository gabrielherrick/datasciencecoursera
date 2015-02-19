#playspace
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases


UserID <- 11316738
submission_login <- "gabrielherrick@gmail.com"
submission_password <- "RMZFhjMrpN"

complete <- function(directory, id=1:332){
        #remember the directory we are in now
        old.dir=getwd()
        
        #go to new directory
        setwd(directory)
        
        #Read in files
        #first find them all
        files<- list.files()
        
        #then read in just the ones we need.
        data.list <- lapply(files[id], read.csv)
        
        #go back to old directory now that we've read our files in.
        setwd(old.dir)
        
        #then bind them all together
        data.cat <- do.call(rbind, data.list)
        
        #subset out ones with right monitor ids
        new.data<- data.cat[data.cat$ID %in% id,]
        
        #select complete cases
        comp.cases <- complete.cases(new.data)
        
        #subset out complete cases
        comp.data <- new.data[comp.cases,]
        
        
}