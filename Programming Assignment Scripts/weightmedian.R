weightmedian <- function(directory, day) {
        files_list <- list.files("diet_data", full.names = TRUE)
        alldata <- data.frame()
        for(i in 1:5){
                alldata <- rbind(alldata, read.csv(files[i]))
        }
        data_subset <- alldata[which(alldata$Day == day), ]
        median(data_subset$Weight, na.rm = TRUE)
}