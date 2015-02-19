#corr.R
corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        files_full<- list.files(directory,full.names=TRUE)
        n_monitors<- length(files_full)
        #then read in them all
        data.list <- lapply(files_full, read.csv)
        
        #then bind them all together
        data.cat <- do.call(rbind, data.list)
        
        data.cat<- data.cat[complete.cases(data.cat),]  #remove NA
        
        data_ids <- data.cat$ID #make vector of IDs, we don't need pollutants
        
        output<-as.data.frame(table(data_ids)) # make a frequency table
        
        colnames(output) <- c("id", "nobs") #rename columns (no biggie)
        
        is_bigger <- output$nobs >= threshold #test if nobs is bigger than thresh.
        
        is_bigger <-rep(is_bigger, output$nobs) #make full column
        
        full_frame <- cbind(data.cat, is_bigger) #bind T/F col to frame
        
        cut_frame <- full_frame[full_frame$is_bigger==TRUE,] #select monitors >= threshold
        
        right_monitors <-unique(cut_frame$ID) 
        #a loop that pulls out values of ID and runs cor on each one
        corrs<-numeric()
        for (i in right_monitors){
                one_mon <- cut_frame[cut_frame$ID==i,]
                cor_1mon <- (cor(one_mon$sulfate, one_mon$nitrate))
                corrs <-c(corrs,cor_1mon)
                
        }
        corrs
}