#' Tranform a dataframe from wide to long
#'
#' @param data A data frame 
#' @param keyname Name of new key column, a string
#' @param chosen_cols Name of columns to be gathered, a list
#' @param valuename name of new value column , a string
#'
#' @return A data frame
#' @export
#'
#' @examples
#' df <- data.frame(Groups = c("A","B"), Married = c(12,25), Other = c(100,55))
#' my_gather(df,"status","count", list("Married","Other"))
#'
#'
#'
my_gather <- function(data, keyname="key",valuename="value",chosen_cols) {
  
  # Return an error for wrong arguments types

  if(is.data.frame(data) == FALSE) {stop("Input data must be a dataframe")}
  else if(assertthat::is.string(keyname) == FALSE) {stop("Input keyname must be a string")}
  else if(assertthat::is.string(valuename) == FALSE) {stop("Input valuename must be a string")}
  else if(is.list(chosen_cols) == FALSE) {stop("Input chosen_cols must be a list")}
  
  # save the content of the "keyname" column in a vector
  
  new_df_key =c()
  
  for (i in chosen_cols){new_df_key =c(new_df_key,rep(i,nrow(data)))}
  
  #save the content of the "valuename" column in a vector
  
  new_df_value =c()
  
  for (j in chosen_cols){new_df_value =c(new_df_value,data[[j]])}
  
  #define the long dataframe
  
  long_data <- data.frame(new_df_key, new_df_value)
  base::names(long_data) <- c(keyname, valuename)
  
  #save column names of columns that are not gathered in a vector
  
  ungathered = c()
  
  col_names_data<- as.list(colnames(data)) # define a list that contains all column names in the input dataframe
  
  for (k in col_names_data ) {if(is.element(k,chosen_cols)==FALSE){ungathered= c(ungathered,k)}
    
  }
  #add ungathered column(s) to the long_data
  
  for (w in ungathered){long_data[w] <- data[[w]]}
  
  return(long_data )  
}
