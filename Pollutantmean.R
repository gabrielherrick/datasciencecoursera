#This shit bananas

pollutantmean <- function(directory, pollutant, id=1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        
        
        #Read in files
        #first find them all. full.names allows us to read in these files 
        #without changing our working directory. 
        files_full<- list.files(directory,full.names=TRUE)
        
        #then read in just the ones we need.
        data.list <- lapply(files_full[id], read.csv)
        
       
        #then bind them all together
        data.cat <- do.call(rbind, data.list)
        
        #don't need to do thisbecause we only read in the ones we need
        #subset out ones with right monitor ids
        #new.data<- data.cat[data.cat$ID %in% id,]
        
        #select column with proper pollutant
        pol.vector<- data.cat[,pollutant]
        
        #eliminate NA
        bad<-is.na(pol.vector)
        pol.vector<- pol.vector[!bad]
        
        #get mean
        round(mean(pol.vector, na.rm=TRUE),3)
}
