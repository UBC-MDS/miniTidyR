#' Returns a new dataframe with the entire rows that contain `na` values removed
#'
#' @param input_dataframe A data frame
#'
#' @return A data frame
#' @export
#'
#' @examples 
#' input_dataframe <-  data.frame(A = c(12,25,NA,45), B = c(12,NA,30,45))
#' my_dropna(input_dataframe)
#' 
#' 
my_dropna <- function(input_dataframe) {
  
  # check whether input is dataframe
  
  if(is.data.frame(input_dataframe)==FALSE){
    stop("Expect input to be a dataframe")}
  
  rows <- nrow(input_dataframe)
  columns <- ncol(input_dataframe)
  to_keep<-numeric(0)
  
  if(rows*columns == 0 ){
    # check if dataframe is empty
    output_dataframe <- input_dataframe
  }else{
    # check through each row
    for(i in 1:rows) {
      na_count <- 0
      # check through each column
      for(k in 1:columns) {
        if(is.na(input_dataframe[i,k])){na_count <- na_count+1}}
      # record index of all the rows with no NA
      if(na_count==0){to_keep<-c(to_keep,i)}} 
    # only keep the rows with no NA
    output_dataframe <- input_dataframe[to_keep, ]}
  
  # changing the rownames to match the new number of rows 
  if(rows*columns != 0 ){
  row.names(output_dataframe)<- 1: nrow(output_dataframe) }
  
  return (output_dataframe)
}

