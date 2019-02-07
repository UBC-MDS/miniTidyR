#' Tranform a dataframe from wide to long
#'
#' @param key strings
#' @param value numeric or strings
#' @param data data.frame
#' @param chosen_cols strings
#'
#' @return data.frame
#' @export
#'
#' @examples
#' a <- data.frame("Groups" = c("A","B","C","D"), "Married" = c(12,25,30,45), "Other" = c(100,55,60,90) )
#' my_gather(a, status,count,Maried,Other)
#'
my_gather <- function(data,key,value,chosen_cols) {

}
