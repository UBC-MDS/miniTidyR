#' Transform a dataframe from long to wide
#'
#' @param keycol Name of column whose content will be the names of the new columns, a string
#' @param valcol Name of column whose content will be the values of the new columns, a sting
#' @param data A data frame
#'
#' @return A data frame
#' @export
#'
#' @examples
#' df <- data.frame(Name = c("A","B"), key = c("Age","Weight"), value = c(45,80))
#' my_spread(df,"key","value")
#'
#'
my_spread <- function(data,keycol,valcol) {

  options( warn=-1)
  temp <- NULL

  # I- Return an error for wrong argument types

  if(is.data.frame(data) == FALSE) {stop("Input data must be a dataframe")}
  if(assertthat::is.string(keycol) == FALSE) {stop("Input keycol must be a string")}
  if(assertthat::is.string(valcol) == FALSE) {stop("Input valcol must be a string")}


  # II-Return a warning message and the input dataframe if keycol or valcol is not in the dataframe

  col_names_list<- as.list(colnames(data))

  if(is.element(keycol,col_names_list)==FALSE | is.element(valcol,col_names_list)==FALSE ) {
    warning("column name does not exist in the data frame, returning input data", immediate. =TRUE)
    return(data) }


  # III-Return an error message when the data do not have unique identifiers

  # 0- drop rows with missing values in the key column

  if (anyNA(data[keycol])==TRUE) {warning("Rows with missing key values were dropped", immediate. =TRUE)
    data= my_dropna(data)}

  # 1- remove the valcol column from the input dataframe

  df_wo_valcol <- data[setdiff(names(data), c(valcol))]

  # 2- get id's of each row

  df_wo_valcol_id <- as.list(dplyr::id(df_wo_valcol))

  # 3- retun an error if id is not unique

  if (anyDuplicated(df_wo_valcol_id)!=0) {stop("Dataframe does not have unique identifiers")}

  # IV-Buid the wide dataframe

  # 1- save new column names of wide dataframe in a list

  new_col_names = unique(data[[keycol]])

  # 2- remove keycol and valcol from data

  df_wo_val_key <- data[setdiff(names(data), c(valcol,keycol))]

  # 3- get unique identifiers for each row

  df_wo_val_key_id <- dplyr::id(df_wo_val_key)

  # 4- create wide data without keycol and valcol

  wide_data <- plyr::split_labels(df_wo_val_key, df_wo_val_key_id)

  # 5- create a unique identifier in wide_data called temp

  wide_data <-tidyr::unite(wide_data, temp ,names(wide_data), remove=F)

  # 6- create a unique identifier in input data called temp

  df_with_val_key<- tidyr::unite(df_wo_val_key, temp ,names(df_wo_val_key), remove=F)
  df_with_val_key<- suppressMessages(dplyr::distinct(dplyr::inner_join(df_with_val_key, data)))

  #7- add keycol and valcol

 for (j in new_col_names){
   wide_data[[j]] <- NA
 }

 # The below code reads from the wide data , matches with corresponding original data with created unique id.   #
 # Then it picks the matched column of that row and insert the 'value' in wide data under the matching column.   #

  for(i in 1:nrow(wide_data)) {
    for(j in 1: nrow(df_with_val_key)) {
      if(wide_data[['temp']][i]== df_with_val_key[['temp']][j]){ # Matching the unique Ids. of wide data with original.
       for (k in new_col_names){                                # Checking the 'key' values to identify the
         if(df_with_val_key[[keycol]][j]==k) {                  # column name of 'key'.
            wide_data[[k]][i] <-  df_with_val_key[[valcol]][j]   # Inserting the 'key' value in wide data column.
          }
        }
      }
    }
  }

wide_data <- as.data.frame(wide_data[-1])

return(wide_data)
}



