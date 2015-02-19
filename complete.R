#complete.R
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

complete <- function(directory, id=1:332){
       
        
        #Read in files
        #first find them all
        files<- list.files(directory, full.names=TRUE)
        
        #then read in just the ones we need.
        data.list <- lapply(files[id], read.csv)
        
        #then bind them all together
        data.cat <- do.call(rbind, data.list)
        
        data.cat<- data.cat[complete.cases(data.cat),]  #remove NA
        
        data_ids <- data.cat$ID #make vector of IDs
        
        dat<- data.frame()
        
        for (i in id) {
                dat<- as.numeric(c(dat,sum(data_ids==i)))
                
        }
        
        output<-data.frame(cbind(id,dat)) #make table into data frame
        
        #output<-as.data.frame(table(data_ids)) # make the table we want
                #the above automatically orders in a way we don't want
        
        colnames(output) <- c("id", "nobs") #rename columns

        output
             
}