complete <- function(directory, id = 1:332) {
        files_list <- list.files(directory, full.names=TRUE)
        dat <- data.frame()
        for(i in id) {
                dat <- rbind(dat, read.csv(files_list[i]))
        }
        cc <- subset(dat, complete.cases(dat) == TRUE)  #good!  this gets me a data frame with all complete cases only
        
        newdf <- data.frame()
        nobs <- NULL
        
        for(i in id) {
                y <- length(subset(cc$ID, cc$ID == i))
                nobs <- append(nobs,y)
        }
        newdf <- cbind(id, nobs)
        print(newdf)
     
}