#' Tranform a dataframe from wide to long
#'
#' @param key numeric or character
#' @param value numeric or character
#' @param data data.frame
#' @param chosen_cols numeric or character
#'
#' @return data.frame
#' @export
#'
#' @examples
#' df <- data.frame(Groups = c("A","B"), Married = c(12,25), Other = c(100,55))
#' my_gather(df, status,count,Married,Other)
#'
my_gather <- function(data,key=NULL,value=NULL,chosen_cols=NULL) {

}
