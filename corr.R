corr <- function(directory, threshold=0){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  files <- list.files(directory, full.names = TRUE) #List of files in directory
  source('complete.R') #Run complete.R script
  data1 <- complete(directory)  #Call function complete and assign it
  data2 <- data1[data1[,'nobs'] > threshold,] #Parse files with threshold
  row_data2 <- dim(data2)[1] # Rows of data2 
  v <- vector() #New empty vector
  j <- 1 #Numero que indica la posicion del vector
  if (row_data2 >0){
    for (i in data2[,'id']){
      f <- read.csv(files[i]) #ith file to be correlated
      c <- cor(f[2:3], use = 'na.or.complete') # correlation matrix
      v[j] <- c[2] #correlation value
      j <- j+1
    }
  }
  v
}