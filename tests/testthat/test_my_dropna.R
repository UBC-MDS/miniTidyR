context("Testing my_dropna")
#' February 2019
#' This script tests the my_dropna function from the miniTidyR package
#' 
#' The my_dropna function returns a new dataframe with the entire rows
#' that containing `na` values removed
#' 

#Test 1: Testing that my_dropna prints an error when the first argument is not a dataframe

test_that("In case input is not a dataframe, it throws an error", {
    
    vec <- c(0,1,2)
    expect_error(my_dropna(vec), "Error: Expect input to be a dataframe")
    
  })

#Test 2: Testing that my_dropna works on a dataframe containing NAs, and with data type as numbers and characters

test_that("In case input is a dataframe containing numbers, characters, and NAs, it works", {
  
  df1 <- data.frame(A = c(12,25,NA,45), B = c(12,NA,30,45), C = c("Yes","No","Yes","No"))
  df2 <- data.frame(A = c(12,45), B = c(12,45), C = c("Yes","No"))
  
  expect_identical(my_dropna(df1), df2)
})

#Test 3: Testing that my_dropna works on a dataframe with no NAs

test_that("In case input is a dataframe containing numbers, characters, and NAs, it works", {
  
  df3 <- data.frame(A = c(12,45), B = c(12,45), C = c("Yes","No"))
  
  expect_identical(my_dropna(df3), df3)
})
