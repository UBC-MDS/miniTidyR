#' Tranform a dataframe from wide to long
#'
#' @param data A data frame
#' @param keyname Name of new key column, a string
#' @param chosen_cols Name of columns to be gathered, a list
#' @param valuename Name of new value column , a string
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

  # Return an error for wrong argument types

  if(is.data.frame(data) == FALSE) {stop("Input data must be a dataframe")}
  else if(assertthat::is.string(keyname) == FALSE) {stop("Input keyname must be a string")}
  else if(assertthat::is.string(valuename) == FALSE) {stop("Input valuename must be a string")}
  else if(is.list(chosen_cols) == FALSE)  {stop("Input chosen_cols must be a list")}


  # Return a warning message and the input dataframe when chosen_cols has wrong column names

  col_names_list<- as.list(colnames(data)) # define a list that contains all column names in the input dataframe

  for (col_names in chosen_cols) { if(is.element(col_names,col_names_list)==FALSE) {warning("column name does not exist in the data frame, returning input data", immediate. =TRUE)
    return(data) }

  }


  # Return a warning message and the input dataframe when chosen_cols is empty

  if(length(chosen_cols)==0) {warning("No columns selected, returning input data", immediate. =TRUE)
    return(data) }


  # Define the transformed data when all arguments are correctly specified

  # 1-save the content of the "keyname" column in a vector

  new_df_key =c()

  for (i in chosen_cols){new_df_key =c(new_df_key,rep(i,nrow(data)))}

  # 2- save the content of the "valuename" column in a vector

  new_df_value =c()

  for (j in chosen_cols){new_df_value =c(new_df_value,data[[j]])}

  # 3-save column names of columns that are not gathered in a vector

  ungathered = c()

  for (k in col_names_list ) {if(is.element(k,chosen_cols)==FALSE){ungathered= c(ungathered,k)}

  }

  # 4-define the long dataframe

  if (length(ungathered)==0) {

  long_data <- data.frame(new_df_key, new_df_value)
  base::names(long_data) <- c(keyname, valuename) } else {

  long_data <- data.frame(new_df_key, new_df_value)
  base::names(long_data) <- c(keyname, valuename)
  for (w in ungathered){long_data[w] <- data[[w]]} #add ungathered column(s) to the long_data
  }

  return(long_data)
}
