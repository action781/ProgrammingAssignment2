corr <- function(directory, threshold = 0) {
        files_list <- list.files(directory, full.names=TRUE)
        dat <- data.frame()
        vector <- NULL
        
        for (i in 1:332){
                dat <- read.csv(files_list[i])
                cc <- subset(dat, complete.cases(dat) == TRUE)
                if(nrow(cc) > threshold){
                        r <- cor(cc[,"sulfate"], cc[,"nitrate"])
                        vector <- append(vector, r)
                }                
        }
        
        if(length(vector)>0){
                print(vector)
        }
        else{
                print(numeric(0))
        }        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!
}