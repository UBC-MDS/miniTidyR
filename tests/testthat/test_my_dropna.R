#' February 2019
#' This script tests the my_dropna function from the miniTidyR package
#' 
#' The my_dropna function returns a new dataframe with the entire rows
#' that containing `na` values removed
#' 

context("Testing my_dropna")

#Test 1

test_that("In case input is not a dataframe, it throws an error", {
    
    vec <- c(0,1,2)
    expect_error(my_dropna(vec), "Error: Expect the input to be a dataframe or a tibble")
    
  })

#Test 2

test_that("In case input is a dataframe containing numbers and characters, it works", {
  
  df1 <- data.frame(A = c(12,25,NA,45), B = c(12,NA,30,45), C = c("Yes","No","Yes","No"))
  df2 <- data.frame(A = c(12,45), B = c(12,45), C = c("Yes","No"))
  
  expect_identical(my_dropna(df1), df2)
})


