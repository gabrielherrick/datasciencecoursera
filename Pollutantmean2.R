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
        
        
        files_list<- list.files(directory,full.names=TRUE) #create a list of files
        
        dat<- data.frame()      #create an empty data frame
        
        for (i in id) {
                #loops through the files, rbinding them together
                dat<- rbind(dat, read.csv(files_list[i]))
        }
        dat_
       
        
        #then bind them all together
        data.cat <- do.call(rbind, data.list)
        
        #don't need to do thisbecause we only read in the ones we need
        #subset out ones with right monitor ids
        #new.data<- data.cat[data.cat$ID %in% id,]
        
        #select column with proper pollutant
        pol.vector<- data.cat[,pollutant]
        
        #eliminate NA
        #bad<-is.na(pol.vector)
        #pol.vector<- pol.vector[!bad]
        
        #get mean
        round(mean(pol.vector,na.rm=TRUE),3)
}
