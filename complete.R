complete <- function(directory, id = 1:332){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a dataframe of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  files <- list.files(directory, full.names = TRUE) #list of files in directory
  data <- data.frame() #creation of empty data frame
  for (i in id){
    file_i <- read.csv(files[i]) #ith file
    cases <- complete.cases(file_i) #Logical vector or rows with full cases
    rows <- dim(file_i[cases,])[1]  #Total rows of file_i full cases
    data <- rbind(data, c(i, rows)) #add row to data frame
  }
  colnames(data) <- c('id','nobs') #rename columns
  data #print data frame
}