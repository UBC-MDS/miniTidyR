context("Testing my_dropna")
#' February 2019
#' This script tests the my_dropna function from the miniTidyR package
#' 
#' The my_dropna function returns a new dataframe with the entire rows
#' that containing `na` values removed
#' 

library(testthat)

# Dataframes
vec <- c(0,1,2)
df1 <- data.frame(A = c(12,25,NA,45), B = c(12,NA,30,45), C = c("Yes","No","Yes","No"))
df2 <- data.frame(A = c(12,45), B = c(12,45), C = c("Yes","No"))
df3 <- data.frame(A = c(1,3), B = c("a","b"), C = c(20,20))
df4 <- data.frame()

#Test 1: Testing that my_dropna prints an error when the first argument is not a dataframe

test_that("In case input is not a dataframe, it throws an error", {
    
    expect_error(my_dropna(vec),"Expect input to be a dataframe")
    
  })

#Test 2: Testing that my_dropna works on a dataframe containing NAs, and with data type as numbers and characters

test_that("In case input is a dataframe containing numbers, characters, and NAs, it works", {
  
  expect_identical(my_dropna(df1), df2) 
})                       

#Test 3: Testing that my_dropna works on a dataframe with no NAs

test_that("In case input is a dataframe containing numbers, characters, and NAs, it works", {
  
  expect_identical(my_dropna(df3), df3)
})

#Test 4: Testing that my_dropna works on a empty dataframe

test_that("my_dropna works on a empty dataframe", {
  
  expect_identical(my_dropna(df4), df4)
})

#Test 5: Testing that the output of my_dropna is also a dataframe

test_that("my_dropna outputs a dataframe", {
  
  expect_identical(class(my_dropna(df1)), "data.frame") 
  expect_identical(class(my_dropna(df2)), "data.frame") 
  expect_identical(class(my_dropna(df3)), "data.frame") 
  expect_identical(class(my_dropna(df4)), "data.frame") 
})
